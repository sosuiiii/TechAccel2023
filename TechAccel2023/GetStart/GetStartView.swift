//
//  GetStartView.swift
//  TechAccel2023
//
//  Created by 田中 颯志 on 9/8/23.
//

import AVFAudio
import SwiftUI

enum StartState {
    case pushStartButton
    case beginningOrContinuation
    case choicePokemon
}

struct GetStartView: View {
    @State private var startState: StartState = .pushStartButton
    @State private var isFinishAnimation = false
    @State private var choicePokemon = false
    var body: some View {
        NavigationStack {
            VStack(alignment: .center) {
                switch startState {
                case .pushStartButton:
                    pushStartButton()
                        .onAppear {
                            AudioPlayerFactory.shared.openingSounds?.play()
                        }

                case .beginningOrContinuation:
                    beginningOrContinuation()

                case .choicePokemon:
                    choicePokemonView()
                        .onAppear {
                            AudioPlayerFactory.shared.openingSounds = nil
                            AudioPlayerFactory.shared.okidSounds?.play()
                        }
                }
            }
        }
    }

    private func pushStartButton() -> some View {
        ZStack(alignment: .center) {
            Asset.Images.start.swiftUIImage
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
            Button(action: {
                AudioPlayerFactory.shared.selectSounds?.play()
                startState = .beginningOrContinuation
            }, label: {
                pokemonFontText(L10n.startButton)
            })
            .padding(.top, 42)
        }
    }

    private func beginningOrContinuation() -> some View {
        ZStack(alignment: .center) {
            Asset.Images.start.swiftUIImage
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
            VStack(alignment: .center, spacing: 0) {

                Button(action: {
                    AudioPlayerFactory.shared.selectSounds?.play()
                    startState = .choicePokemon
                }, label: {
                    pokemonFontText(L10n.beginning)
                })
                .padding(.top, 30)
                .padding(.vertical, 12)

                NavigationLink {
                    // storeに保存したポケモンを取得するようにする
                    TopTabScreen(choicedPokemon: .hitokage)
                } label: {
                    pokemonFontText(L10n.continuation)
                }
            }
        }
    }

    private func choicePokemonView() -> some View {
        Group {
            Asset.Images.okid.swiftUIImage
            StepByStepTextView(L10n.startOkid) {
                isFinishAnimation = true
            }
            if isFinishAnimation {
                NavigationLink {
                    ChoicePokemonScreen()
                } label: {
                    pokemonFontText(L10n.choicePokemon)
                        .padding(.top, 10)
                }
            }
        }
    }
}
