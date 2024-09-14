//
//  PokemonProjectApp.swift
//  PokemonProject
//
//  Created by A.d. Ahmed on 4/29/24.
//

import SwiftUI

@main
struct PokemonProjectApp: App {
    var body: some Scene {
        WindowGroup {
            PokemonMainView(vm: PokeViewModel())
        }
    }
}
