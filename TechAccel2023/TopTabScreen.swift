//
//  TopTabScreen.swift
//  TechAccel2023
//
//  Created by 田中 颯志 on 9/9/23.
//

import Foundation
import SwiftUI

struct TopTabScreen: View, Hashable {
    var body: some View {
        TabView {
            Text("b")
                .tabItem {
                    VStack {
                        Asset.Images.sword.swiftUIImage
                            .renderingMode(.template)
                        Text(L10n.battle)
                    }
                }
                .tag(0)
            Text("a")
                .tabItem {
                    VStack {
                        Asset.Images.ball.swiftUIImage
                            .renderingMode(.template)
                        Text(L10n.gacha)
                    }
                }
                .tag(1)
            Text("c")
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
