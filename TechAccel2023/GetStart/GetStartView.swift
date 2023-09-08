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
                }
            }
        }
    }

    private func pushStartButton() -> some View {
        ZStack(alignment: .center) {
            Image("start")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
            Button(action: {
                AudioPlayerFactory.shared.selectSounds?.play()
                startState = .beginningOrContinuation
            }, label: {
                Text("PUSH START BUTTON")
                    .font(.custom("x12y12pxMaruMinya", size: 18))
                    .foregroundColor(.white)
            })
            .padding(.top, 42)
        }
    }

    private func beginningOrContinuation() -> some View {
        ZStack(alignment: .center) {
            Image("start")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
            VStack(alignment: .center, spacing: 0) {

                Button(action: {
                    AudioPlayerFactory.shared.selectSounds?.play()
                    startState = .choicePokemon
                }, label: {
                    pokemonFontText("はじめから")
                        .foregroundColor(.white)
                })
                .padding(.top, 30)
                .padding(.vertical, 12)
                
                Button(action: {
                    close()
                }, label: {
                    pokemonFontText("つづきから")
                        .foregroundColor(.white)
                })
            }
        }
    }

    private func choicePokemonView() -> some View {
        Group {
            Image("okid")
            StepByStepTextView("ポケットモンスターの せかい へ ようこそ！ さっそくだが、いっしょにぼうけんにでかける　ポケモンを　えらんでもらえないか？。") {
                isFinishAnimation = true
            }
            if isFinishAnimation {
                NavigationLink {
                    EmptyView()
                } label: {
                    pokemonFontText("▶︎ポケモンをえらぶ")
                        .padding(.top, 10)
                }
            }
        }
    }
}
