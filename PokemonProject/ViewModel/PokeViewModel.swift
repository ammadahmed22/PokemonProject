//
//  PokeViewModel.swift
//  PokemonProject
//
//  Created by A.d. Ahmed on 4/29/24.
//

import Foundation
import Alamofire

class PokeViewModel: ObservableObject {
    
    @Published var pokemonList = [Pokemon]()
    @Published var pokemonDetails: DetailPokemon?
    @Published var isLoading = false
    @Published var searchText = ""
    private var offset = Constants.Limits.apiOffset
    private let limit = Constants.Limits.apiLimit

    var filteredPokemon: [Pokemon] {
        if searchText.isEmpty {
            return pokemonList
        } else {
            let filtered = pokemonList.filter { $0.name.lowercased().contains(searchText.lowercased()) }
            if filtered.isEmpty && !isLoading {
                fetchPokemonByNameOrId(searchText)
            }
            return filtered
        }
    }

    func getData() {
        guard !isLoading else { return }
        isLoading = true
        
        let url = "\(Constants.URLs.baseAPI)?offset=\(offset)&limit=\(limit)"
        AF.request(url, method: .get).responseData { [weak self] response in
            guard let self = self else { return }
            self.handleResponse(response)
        }
    }
    
    func getDetails(pokemon: Pokemon) {
        let id = getPokemonIndex(pokemon: pokemon)
        fetchPokemonDetails(id: id)
    }

    func fetchPokemonByNameOrId(_ query: String) {
        isLoading = true
        let url = "\(Constants.URLs.baseAPI)/\(query.lowercased())"
        AF.request(url, method: .get).responseData { [weak self] response in
            guard let self = self else { return }
            self.handleResponse(response)
        }
    }

    private func fetchPokemonDetails(id: Int) {
        let url = "\(Constants.URLs.baseAPI)/\(id)/"
        AF.request(url, method: .get).responseData { [weak self] response in
            guard let self = self else { return }
            self.handleResponse(response)
        }
    }
    
    private func handleResponse(_ response: AFDataResponse<Data>) {
        switch response.result {
        case .success(let data):
            do {
                if let pokemonModel = try? JSONDecoder().decode(PokemonModel.self, from: data) {
                    self.pokemonList.append(contentsOf: pokemonModel.results)
                    self.offset += self.limit
                } else {
                    let details = try JSONDecoder().decode(DetailPokemon.self, from: data)
                    self.pokemonDetails = details
                }
                self.isLoading = false
            } catch {
                print("Error decoding data: \(error)")
            }
        case .failure(let error):
            print("Error making request: \(error)")
            self.isLoading = false
        }
    }
// Helper Function
    func getPokemonIndex(pokemon: Pokemon) -> Int {
        if let index = self.pokemonList.firstIndex(of: pokemon) {
            if index >= 1025 {
                return 10000 + (index - 1025) + 1
            }
            return index + 1
        }
        return 0
    }
    
    func hectogramsToPounds(_ hectograms: Int) -> Int {
        let pounds = Double(hectograms) * 0.220462
        return Int(round(pounds))
    }
    
    func centimetersToFeetAndInches(_ centimeters: Int) -> String {
        let adjustedCentimeters = centimeters * 10
        let totalInches = Double(adjustedCentimeters) / 2.54
        let feet = Int(totalInches / 12)
        let inches = Int(totalInches.truncatingRemainder(dividingBy: 12))
        return "\(feet)'\(inches)\""
    }
}

extension DetailPokemon {
    func stat(forName name: String) -> Int {
        return stats.first { $0.stat.name == name }?.baseStat ?? 0
    }
}
