//
//  PokemonView.swift
//  PokemonProject
//
//  Created by A.d. Ahmed on 4/29/24.
//

import SwiftUI
import Kingfisher

struct PokemonView: View {
    @ObservedObject var vm: PokeViewModel
    let pokemon: Pokemon
    
    var body: some View {
        VStack {
            KFImage(URL(string: "\(Constants.URLs.sampleImage)\(vm.getPokemonIndex(pokemon: pokemon)).png"))
                .placeholder {
                    ProgressView()
                        .frame(width: Constants.Dimensions.pokemonViewSize, height: Constants.Dimensions.pokemonViewSize)
                }
                .resizable()
                .scaledToFit()
                .frame(width: Constants.Dimensions.pokemonViewSize, height: Constants.Dimensions.pokemonViewSize)
                .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            
            
            Text("\(pokemon.name.capitalized)")
                .font(.system(size: Constants.Text.gridTextSize, weight: .regular, design: .monospaced))
                .foregroundStyle(Constants.Colors.foreground)
                .padding(.bottom, 20)
            
        }
    }
}
