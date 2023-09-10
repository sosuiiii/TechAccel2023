//
//  ImageURL+Util.swift
//  TechAccel2023
//
//  Created by 田中 颯志 on 9/8/23.
//

import Foundation

enum ImageURL {
    enum Pokemon {
        // 1.フシギダネ,2.フシギソウ,3.フシギバナ
        // 4.ヒトカゲ,5.リザード,6.リザードン
        // 7.ゼニガメ,8.カメール,9.カメックス, 10...1010
        static func frontUrlString(_ id: Int8) -> String {
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(id).png"
        }

        static func backUrlString(_ id: Int8) -> String {
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/\(id).png"
        }
    }
    enum Item {
        static let potionURL = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/items/potion.png"
    }
}
