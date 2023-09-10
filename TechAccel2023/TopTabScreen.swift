//
//  TopTabScreen.swift
//  TechAccel2023
//
//  Created by 田中 颯志 on 9/9/23.
//

import Foundation
import SwiftUI

struct TopTabScreen: View, Hashable {
    let choicedPokemon: StartPokemon
    var body: some View {
        TabView {
            BattleScreen()
                .tabItem {
                    VStack {
                        Asset.Images.sword.swiftUIImage
                            .renderingMode(.template)
                        Text(L10n.battle)
                    }
                }
                .tag(0)

            MapScreen()
                .tabItem {
                    VStack {
                        Asset.Images.ball.swiftUIImage
                            .renderingMode(.template)
                        Text(L10n.map)
                    }
                }
                .tag(1)

            PokemonListScreen()
                .tabItem {
                    VStack {
                        Asset.Images.bag.swiftUIImage
                            .renderingMode(.template)
                        Text(L10n.ball)
                    }
                }
                .tag(2)
        }
        .accentColor(.green)
        .navigationBarBackButtonHidden()
    }
}
