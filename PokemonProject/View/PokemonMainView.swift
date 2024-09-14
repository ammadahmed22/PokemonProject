//
//  PokemonMainView.swift
//  PokemonProject
//
//  Created by A.d. Ahmed on 4/29/24.
//

import SwiftUI

struct PokemonMainView: View {
    @ObservedObject var vm: PokeViewModel
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: Constants.Limits.gridMinimum))
    ]
    
    init(vm: PokeViewModel) {
            self.vm = vm
        }
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: adaptiveColumns, spacing: 10) {
                    ForEach(vm.filteredPokemon) { pokemon in
                        NavigationLink(destination: PokemonDetailView(vm: vm, pokemon: pokemon)
                        ) {
                            PokemonView(vm: vm, pokemon: pokemon)
                                .onAppear {
                                    if pokemon == vm.filteredPokemon.last {
                                        vm.getData()
                                    }
                                }
                        }
                    }
                }
                .animation(.easeInOut(duration: 0.3), value: vm.filteredPokemon.count)
                .navigationTitle(Constants.Text.navigationTitle)
                .navigationBarTitleDisplayMode(.inline)
            }
            .containerRelativeFrame([.horizontal, .vertical])
            .background(Gradient(colors: [.teal, .cyan, .green]).opacity(0.6))
            .searchable(text: $vm.searchText,placement: .navigationBarDrawer(displayMode: .always))
            .onAppear {
                DispatchQueue.main.async {
                    self.vm.getData()
                }
            }
        }
        .environmentObject(vm)
    }
}

#Preview {
    PokemonMainView(vm: PokeViewModel())
}
