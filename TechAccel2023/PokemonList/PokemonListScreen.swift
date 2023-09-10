//
//  PokemonListScreen.swift
//  TechAccel2023
//
//  Created by 田中 颯志 on 9/10/23.
//

import Foundation
import SwiftUI

struct PokemonListScreen: View {
    @StateObject private var viewModel = PokemonListViewModel()
    var body: some View {
        VStack {
            List(viewModel.pokemons) { pokemon in
                pokemonCell(with: pokemon)
            }
        }
        .onAppear {
            viewModel.fetchPokemon()
            if AudioPlayerFactory.shared.nibiCitySounds?.isPlaying == false {
                AudioPlayerFactory.shared = AudioPlayerFactory()
                AudioPlayerFactory.shared.nibiCitySounds?.play()
            }
        }
    }

    private func pokemonCell(with data: Pokemon) -> some View {
        HStack {
            data.image
                .resizable()
                .frame(width: 60, height: 60)
                .background(Asset.Colors.blackWhite.swiftUIColor)
                .cornerRadius(10)
            Text(data.name)
            Spacer()
            Asset.Images.nomalBall.swiftUIImage
                .resizable()
                .frame(width: 30, height: 30)
        }
    }
}

final class PokemonListViewModel: ObservableObject {
    let repository = PokemonListRepository()
    @Published var pokemons: [Pokemon] = []
    func fetchPokemon() {
        pokemons = repository.fetchPokemon()
    }
}

final class PokemonListRepository {
    func fetchPokemon() -> [Pokemon] {
        [
            .init(),
            .init(),
            .init()
        ]
    }
}

struct Pokemon: Identifiable {
    var id = UUID().uuidString
    var name = "フシギダネ"
    var image = Asset.Images.fushigidane.swiftUIImage
}
