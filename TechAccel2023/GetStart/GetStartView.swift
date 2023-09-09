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
    private let close: (() -> Void)
    init(_ closeHandler: @escaping (() -> Void)) {
        self.close = closeHandler
    }
    var body: some View {
        NavigationView {
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
                Text(L10n.startButton)
                    .font(.custom(FontFamily.X12y12pxMaruMinya.regular.family, size: 18))
                    .foregroundColor(.white)
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
                        .foregroundColor(.white)
                })
                .padding(.top, 30)
                .padding(.vertical, 12)
                
                Button(action: {
                    close()
                }, label: {
                    pokemonFontText(L10n.continuation)
                        .foregroundColor(.white)
                })
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
