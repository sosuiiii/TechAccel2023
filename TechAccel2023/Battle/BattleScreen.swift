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
                Spacer()
                Asset.Images.rizardon.swiftUIImage
                    .resizable()
                    .frame(width: 100, height: 100)
            }
            Spacer()
            HStack {
                Asset.Images.fushigidaneBack.swiftUIImage
                    .resizable()
                    .frame(width: 100, height: 100)
                Spacer()
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
