//
//  Constants.swift
//  PokemonProject
//
//  Created by A.d. Ahmed on 4/30/24.
//

import SwiftUI

struct Constants {
    struct URLs {
        static let baseAPI = "https://pokeapi.co/api/v2/pokemon"
        static let sampleImage = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/"
    }

    struct Colors {
        static let backgroundGradientTop = Color.teal
        static let backgroundGradientMiddle = Color.cyan
        static let backgroundGradientBottom = Color.green
        static let foreground = Color.white
    }

    struct Text {
        static let navigationTitle = "PokemonUI"
        static let infoBoxTextSize: CGFloat = 16
        static let detailTitleSize: CGFloat = 30
        static let gridTextSize: CGFloat = 16
    }

    struct Dimensions {
        static let pokemonViewSize: CGFloat = 150.0
        static let detailViewSize: CGFloat = 300.0
    }
    
    struct Limits {
        static let apiLimit: Int = 20
        static let apiOffset: Int = 0
        static let gridMinimum: CGFloat = 150
    }
}
