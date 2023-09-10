//
//  ViewController.swift
//  TechAccel2023
//
//  Created by 田中 颯志 on 9/8/23.
//

import UIKit
import AVFAudio

final class GetStartViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let getStartView = GetStartView()
        let getStartUiView = getStartView.uiview()
        view.addSubview(getStartUiView)
        NSLayoutConstraint.activate([
            getStartUiView.topAnchor.constraint(equalTo: view.topAnchor),
            getStartUiView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            getStartUiView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            getStartUiView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
