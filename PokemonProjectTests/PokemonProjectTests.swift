//
//  PokemonProjectTests.swift
//  PokemonProjectTests
//
//  Created by A.d. Ahmed on 4/29/24.
//

import XCTest
@testable import PokemonProject
import Alamofire // Make sure to import Alamofire for testing

class PokemonFilterTests: XCTestCase {
    var viewModel: PokeViewModel!
    var expectedData: Data!


    override func setUp() {
        super.setUp()
        viewModel = PokeViewModel()
        // Setup initial pokemon list
        viewModel.pokemonList = [
            Pokemon(name: "Bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/1"),
            Pokemon(name: "Ivysaur", url: "https://pokeapi.co/api/v2/pokemon/2"),
            Pokemon(name: "Venusaur", url: "https://pokeapi.co/api/v2/pokemon/3"),
            Pokemon(name: "Charmander", url: "https://pokeapi.co/api/v2/pokemon/4"),
            Pokemon(name: "Charmeleon", url: "https://pokeapi.co/api/v2/pokemon/5"),
            Pokemon(name: "Charizard", url: "https://pokeapi.co/api/v2/pokemon/6")
        ]
    }

    func testPokemonFilterWithEmptySearchText() {
        viewModel.searchText = ""
        XCTAssertEqual(viewModel.filteredPokemon.count, 6)
    }

    func testPokemonFilterWithNonEmptySearchText() {
        viewModel.searchText = "char"
        XCTAssertEqual(viewModel.filteredPokemon.count, 3)
    }

    func testGetDataWhileLoading() {
        viewModel.isLoading = true
        viewModel.getData()
        // Test that no network request is made when already loading
    }

    func testGetDataSuccessful() {
        viewModel.isLoading = false
        stubNetworkResponse(with: 200, data: expectedData)
        viewModel.getData()
        XCTAssertTrue(viewModel.isLoading)
      
    }

    func testGetDataFailure() {
        viewModel.isLoading = false
        stubNetworkResponse(with: 500, data: nil)
        viewModel.getData()
        XCTAssertTrue(viewModel.isLoading)
      
    }

    override func tearDown() {
        viewModel = nil
        
        super.tearDown()
    }

   
    private func stubNetworkResponse(with statusCode: Int, data: Data?) {
    
    }
}
