//
//  Audio+Util.swift
//  TechAccel2023
//
//  Created by 田中 颯志 on 9/8/23.
//

import AVFAudio
import Foundation

enum PokemonBGM: String {
    /// 01~オープニング~
    case opening = "01opening"
}

struct AudioError: Error {
    let type: AudioErrorType
    enum AudioErrorType {
        case notFoundFile
        case description(Error)
    }
}

enum AudioPlayerFactory {
    static func makePlayer(_ fileType: PokemonBGM) -> Result<AVAudioPlayer, Error> {
        let filename: String
        switch fileType {
        case .opening:
            filename = fileType.rawValue
        }
        guard let path = Bundle.main.path(forResource: filename, ofType: "wav") else {
            return .failure(AudioError(type: .notFoundFile))
        }
        let soundFileURL = URL(fileURLWithPath: path)
        do {
            try AVAudioSession.sharedInstance().setCategory(
                AVAudioSession.Category.ambient
            )
            try AVAudioSession.sharedInstance().setActive(true)
            let player = try AVAudioPlayer(contentsOf: soundFileURL)
            return .success(player)
        } catch {
            return .failure(error)
        }
    }
}
