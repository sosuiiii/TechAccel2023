//
//  ViewController.swift
//  TechAccel2023
//
//  Created by 田中 颯志 on 9/8/23.
//

import UIKit
import AVFAudio

final class ViewController: UIViewController {
    private var player: AVAudioPlayer!
    override func viewDidLoad() {
        super.viewDidLoad()

        switch AudioPlayerFactory.makePlayer(.opening) {
        case .success(let player):
            self.player = player
            player.delegate = self
            player.volume = 1
            player.prepareToPlay()
            player.play()
        case .failure(let error):
            print(error)
        }
    }
}

extension ViewController: AVAudioPlayerDelegate {
}
