//
//  StartAdventureScreen.swift
//  TechAccel2023
//
//  Created by 田中 颯志 on 9/9/23.
//

import Foundation
import SwiftUI

struct StartAdventureScreen: View {
    let pokemon: StartPokemon
    @State private var y: CGFloat = 0
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                pokemon.image
                    .resizable()
                    .frame(width: 200, height: 200)
                    .offset(y: y)
                pokemonFontText(L10n.choicedPokemon(pokemon.name))
                Spacer()
            }
            .onAppear {
                jump(delay: 0)
                landing(delay: 0.5)
                jump(delay: 1.0)
                landing(delay: 1.5)
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                    switch pokemon {
                    case .fushigidane:
                        AudioPlayerFactory.shared.fushigidaneSounds?.play()
                    case .hitokage:
                        AudioPlayerFactory.shared.hitokageSounds?.play()
                    case .zenigame:
                        AudioPlayerFactory.shared.zenigameSounds?.play()
                    }
                }
            }
        }
        .navigationBarBackButtonHidden()
    }

    private func jump(delay: CGFloat) {
        withAnimation(.easeIn(duration: 0.5).delay(delay)) {
            y = -50
        }
    }

    private func landing(delay: CGFloat) {
        withAnimation(.easeIn(duration: 0.5).delay(delay)) {
            y = 0
        }
    }
}
