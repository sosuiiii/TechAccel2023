//
//  Audio+Util.swift
//  TechAccel2023
//
//  Created by 田中 颯志 on 9/8/23.
//

import AVFAudio
import Foundation

struct AudioError: Error {
    let type: AudioErrorType
    enum AudioErrorType {
        case notFoundFile
        case description(Error)
    }
}

final class AudioPlayerFactory {
    static let shared = AudioPlayerFactory()
    var openingSounds: AVAudioPlayer?
    var okidSounds: AVAudioPlayer?
    var selectSounds: AVAudioPlayer?
    init() {
        if case let .success(player) = AudioPlayerFactory.makePlayer(Files._01openingWav) {
            openingSounds = player
        }
        if case let .success(player) = AudioPlayerFactory.makePlayer(Files._04okidWav) {
            okidSounds = player
        }
        if case let .success(player) = AudioPlayerFactory.makePlayer(Files.selectWav, repeatCount: 0) {
            selectSounds = player
        }
    }
    static func makePlayer(_ file: File, repeatCount: Int = 3) -> Result<AVAudioPlayer, Error> {
        let soundFileURL = URL(fileURLWithPath: file.path)
        do {
            try AVAudioSession.sharedInstance().setCategory(
                AVAudioSession.Category.ambient
            )
            try AVAudioSession.sharedInstance().setActive(true)
            let player = try AVAudioPlayer(contentsOf: soundFileURL)
            player.numberOfLoops = repeatCount
            return .success(player)
        } catch {
            return .failure(error)
        }
    }
}
