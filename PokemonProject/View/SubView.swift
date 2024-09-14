//
//  SubView.swift
//  PokemonProject
//
//  Created by A.d. Ahmed on 4/29/24.
//

import SwiftUI

struct HCard: View {
    @ObservedObject var vm: PokeViewModel
    let pokemon: Pokemon
    
    var body: some View {
        HStack(spacing: 20) {
            if let details = vm.pokemonDetails {
                VStack(alignment: .center, spacing: 10) {
                    HStack(alignment: .center, spacing: 50) {
                        StatItem(value: "\(vm.hectogramsToPounds(vm.pokemonDetails?.weight ?? 0)) lbs", label: "Weight")
                        StatItem(value: vm.centimetersToFeetAndInches(vm.pokemonDetails?.height ?? 0), label: "Height")
                        StatItem(value: "\(vm.pokemonDetails?.id ?? 0)", label: "ID")
                    }
                    
                    Divider()
                    
                    HStack(alignment: .center, spacing: 25) {
                        
                        StatItem(value: "\(details.stat(forName: "hp"))", label: "HP")
                        StatItem(value: "\(details.stat(forName: "attack"))", label: "Attack")
                        StatItem(value: "\(details.stat(forName: "defense"))", label: "Defense")
                        StatItem(value: "\(details.stat(forName: "speed"))", label: "Speed")
                    }
                }
            }
        }
        .padding(30)
        .frame(maxWidth: 350, maxHeight: 150)
        .foregroundStyle(Constants.Colors.foreground)
        .background(Gradient(colors: [Constants.Colors.backgroundGradientTop, Constants.Colors.backgroundGradientMiddle]).opacity(0.6))
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .onAppear {
            vm.getDetails(pokemon: pokemon)
        }
    }
}

struct PokemonTitleView: View {
    @EnvironmentObject var vm: PokeViewModel
    let pokemon: Pokemon
    var body: some View {
        
        VStack {
            Text("\(pokemon.name.capitalized)")
                .font(.system(size: Constants.Text.detailTitleSize, weight: .bold, design: .monospaced))
                .foregroundStyle(Constants.Colors.foreground)
            HStack {
                if let detailed = vm.pokemonDetails {
                    ForEach(detailed.types, id: \.type.name) { type in
                        Text(type.type.name.capitalized)
                            .foregroundStyle(Constants.Colors.foreground)
                        
                    }
                }
            }
        }
        .padding(.bottom, 50)
        .onAppear {
            vm.getDetails(pokemon: pokemon)
        }
    }
}

struct StatItem: View {
    var value: String
    var label: String
    
    var body: some View {
        VStack {
            Text(value)
                .font(.system(size: Constants.Text.infoBoxTextSize))
            Text(label)
                .font(.system(size: Constants.Text.infoBoxTextSize,weight: .medium, design: .rounded))
        }
    }
}
