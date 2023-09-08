//
//  StepByStepTextView.swift
//  TechAccel2023
//
//  Created by 田中 颯志 on 9/8/23.
//

import Foundation
import SwiftUI

struct StepByStepTextView: View {
    @State var text: String = ""
    private let characters: String
    private let finishAnimation: (() -> Void)
    init(_ characters: String, finishAnimation: @escaping (() -> Void)) {
        self.characters = characters
        self.finishAnimation = finishAnimation
    }
    
    var body: some View {
        HStack(spacing: 5) {
            Text(text)
                .font(.custom("x12y12pxMaruMinya", size: 16))
                .lineLimit(5)
                .kerning(1)
                .lineSpacing(2)
                .frame(alignment: .leading)
                .fixedSize(horizontal: false, vertical: true)
        }
        .frame(height: 80)
        .frame(maxWidth: .infinity)
        .padding(.all, 12)
        .background(Color(red: 121/255, green: 162/255, blue: 162/255))
        .cornerRadius(5)
        .onAppear {
            characters.enumerated().forEach { index, element in
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1 * Double(index)) {
                    if element == "," {
                        text = ""
                    } else if index == characters.count - 1 {
                        finishAnimation()
                    } else {
                        text += "\(element)"
                    }
                }
            }
        }
    }
}
