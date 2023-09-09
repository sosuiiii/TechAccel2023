//
//  Pokemon.swift
//  TechAccel2023
//
//  Created by 田中 颯志 on 9/9/23.
//

import Foundation
import SwiftUI

enum StartPokemon: CaseIterable, Identifiable {
    var id: String { UUID().uuidString }
    case fushigidane
    case hitokage
    case zenigame
    var name: String {
        switch self {
        case .fushigidane:
            return L10n.bulbasaur
        case .hitokage:
            return L10n.charmander
        case .zenigame:
            return L10n.squirtle
        }
    }
    var image: Image {
        switch self {
        case .fushigidane:
            return Asset.Images.fushigidane.swiftUIImage
        case .hitokage:
            return Asset.Images.hitokage.swiftUIImage
        case .zenigame:
            return Asset.Images.zenigame.swiftUIImage
        }
    }
}
