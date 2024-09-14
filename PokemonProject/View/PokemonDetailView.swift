//
//  PokemonDetailView.swift
//  PokemonProject
//
//  Created by A.d. Ahmed on 4/29/24.
//

import SwiftUI
import Kingfisher

struct PokemonDetailView: View {
    @ObservedObject var vm: PokeViewModel
    let pokemon: Pokemon
    
    var body: some View {
        VStack {
            KFImage(URL(string: "\(Constants.URLs.sampleImage)\(vm.getPokemonIndex(pokemon: pokemon)).png"))
                .placeholder {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .frame(width: Constants.Dimensions.detailViewSize, height: Constants.Dimensions.detailViewSize)
                }
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: Constants.Dimensions.detailViewSize, height: Constants.Dimensions.detailViewSize)
                .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            
            
            PokemonTitleView(pokemon: pokemon)
            HCard(vm: vm, pokemon: pokemon)
            
        }
        .containerRelativeFrame([.horizontal, .vertical])
        .background(Gradient(colors: [Constants.Colors.backgroundGradientTop, Constants.Colors.backgroundGradientMiddle, Constants.Colors.backgroundGradientBottom]).opacity(0.6))
    }
}
