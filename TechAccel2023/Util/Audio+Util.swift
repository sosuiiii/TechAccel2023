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
    static var shared = AudioPlayerFactory()
    var openingSounds: AVAudioPlayer?
    var okidSounds: AVAudioPlayer?
    var selectSounds: AVAudioPlayer?
    var fushigidaneSounds: AVAudioPlayer?
    var hitokageSounds: AVAudioPlayer?
    var zenigameSounds: AVAudioPlayer?
    var battleToWildSounds: AVAudioPlayer?
    var nibiCitySounds: AVAudioPlayer?
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
        if case let .success(player) = AudioPlayerFactory.makePlayer(Files.fushigidaneWav, repeatCount: 0) {
            fushigidaneSounds = player
        }
        if case let .success(player) = AudioPlayerFactory.makePlayer(Files.hitokageWav, repeatCount: 0) {
            hitokageSounds = player
        }
        if case let .success(player) = AudioPlayerFactory.makePlayer(Files.zenigameWav, repeatCount: 0) {
            zenigameSounds = player
        }
        if case let .success(player) = AudioPlayerFactory.makePlayer(Files._07battleToWildWav) {
            battleToWildSounds = player
        }
        if case let .success(player) = AudioPlayerFactory.makePlayer(Files._09nibiCityWav, repeatCount: 30) {
            nibiCitySounds = player
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
