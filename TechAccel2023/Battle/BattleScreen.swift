//
//  BattleScreen.swift
//  TechAccel2023
//
//  Created by 田中 颯志 on 9/10/23.
//

import Foundation
import SwiftUI

struct BattleScreen: View {
    var body: some View {
        VStack {
            HStack {
                VStack {
                    pokemonFontText("瀕死のリザードン♂ Lv46")
                    ProgressView(value: 0.01, total: 1.0)
                        .tint(.red)
                    Spacer()
                }
                Spacer()
                Asset.Images.rizardon.swiftUIImage
                    .resizable()
                    .frame(width: 100, height: 100)
            }
            .frame(height: 80)
            .padding(.top, 80)
            Spacer()
            HStack {
                Asset.Images.fushigidaneBack.swiftUIImage
                    .resizable()
                    .frame(width: 100, height: 100)
                VStack {
                    pokemonFontText("最強のフシギダネ♂ Lv6")
                    ProgressView(value: 1.0, total: 1.0)
                        .tint(.green)
                    Spacer()
                }
            }
            .frame(height: 80)
            HStack {
                Spacer()
                Button(action: {
                    
                }, label: {
                    pokemonFontText("▶︎たたかう")
                })
                Button(action: {
                    
                }, label: {
                    pokemonFontText("▶︎にげる")
                })
            }
            StepByStepTextView(L10n.encounterPokemon("リザードン"), finishAnimation: {})
        }
        .padding()
        .onAppear {
            AudioPlayerFactory.shared = AudioPlayerFactory()
            AudioPlayerFactory.shared.battleToWildSounds?.play()
        }
    }
}

struct BattleScreen_Previews: PreviewProvider {
    static var previews: some View {
        BattleScreen()
    }
}
