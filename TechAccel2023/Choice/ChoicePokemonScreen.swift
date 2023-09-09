//
//  ChoicePokemonScreen.swift
//  TechAccel2023
//
//  Created by 田中 颯志 on 9/9/23.
//

import SwiftUI

struct ChoicePokemonScreen: View {
    @State private var choicedPokemon: StartPokemon?
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                Asset.Images.okid.swiftUIImage
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 250)
                    .padding(.vertical, 50)
                HStack(spacing: 0) {
                    ForEach(StartPokemon.allCases) {
                        choicePokemonView($0)
                    }
                }
                .padding(.top, 30)
                Spacer()
                if let choicedPokemon {
                    NavigationLink {
                    } label: {
                        pokemonFontText(L10n.startAdventure)
                            .padding(.bottom, 12)
                    }
                    switch choicedPokemon {
                    case .fushigidane:
                        StepByStepTextView(L10n.getPokemon(choicedPokemon.name), finishAnimation: {})
                    case .hitokage:
                        StepByStepTextView(L10n.getPokemon(choicedPokemon.name), finishAnimation: {})
                    case .zenigame:
                        StepByStepTextView(L10n.getPokemon(choicedPokemon.name), finishAnimation: {})
                    }
                }
            }
        }
        .navigationBarBackButtonHidden()
    }

    private func choicePokemonView(_ choiceType: StartPokemon) -> some View {
        VStack {
            if choicedPokemon == choiceType {
                choiceType.image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 120)
                    .background(Color.white)
                    .cornerRadius(60)
            } else {
                Spacer()
                    .frame(width: 120, height: 120)
            }
            Button(action: {
                switch choiceType {
                case .fushigidane:
                    AudioPlayerFactory.shared.fushigidaneSounds?.play()
                case .hitokage:
                    AudioPlayerFactory.shared.hitokageSounds?.play()
                case .zenigame:
                    AudioPlayerFactory.shared.zenigameSounds?.play()
                }
                withAnimation(.easeIn(duration: 0.3)) {
                    choicedPokemon = choiceType
                }
            }, label: {
                Asset.Images.nomalBall.swiftUIImage
                    .resizable()
                    .frame(width: 44, height: 44)
            })
        }
    }
}

struct ChoicePokemonScreen_Previews: PreviewProvider {
    static var previews: some View {
        ChoicePokemonScreen()
    }
}
