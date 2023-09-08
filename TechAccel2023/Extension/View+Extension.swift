//
//  View+Extension.swift
//  TechAccel2023
//
//  Created by 田中 颯志 on 9/8/23.
//

import SwiftUI

extension View {
    func uiview() -> UIView {
        let hostingController = UIHostingController(rootView: self)
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        hostingController.view.backgroundColor = .clear
        hostingController.view.setContentHuggingPriority(.required, for: .vertical)
        return hostingController.view
    }

    func pokemonFontText(_ text: String) -> some View {
        Text(text)
            .font(.custom("x12y12pxMaruMinya", size: 18))
            .foregroundColor(.white)
    }
}
