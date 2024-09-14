//
//  PokeModel.swift
//  PokemonProject
//
//  Created by A.d. Ahmed on 4/29/24.
//

import Foundation

struct PokemonModel: Codable {
    var results: [Pokemon]
}

struct Pokemon: Codable, Identifiable,Equatable {
    let id = UUID()
    var name: String
    var url: String
    
}

struct DetailPokemon: Codable {
    let id: Int
    var height: Int
    var weight: Int
    var stats: [StatDetail]
    var types: [TypeDetail]
}

struct StatDetail: Codable {
    var baseStat: Int
    var effort: Int
    var stat: Stat
    
    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case effort
        case stat
    }
}
struct Stat: Codable {
    var name: String
    var url: String
}

struct TypeDetail: Codable {
    var slot: Int
    var type: PokemonType
}

struct PokemonType: Codable {
    var name: String
    var url: String
}
