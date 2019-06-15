//
//  PadButton.swift
//  MealPlan
//
//  Created by blakerogers on 6/8/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import UIKit
import Utilities
import CleanModelViewIntent
import MealPlanDomain

class PadButton: UXButton {
    var padOutput: PadOutput!
}
extension PadButton {
    static func padIcon(icon: FontelloIcons, size: IconSize = .normal, tint: UIColor, borderWidth: CGFloat = 1.0, borderColor: UIColor = .clear, radius: CGFloat = 0) -> PadButton {
        let button = PadButton()
        button.tintColor = tint
        button.layer.borderColor = borderColor.cgColor
        button.layer.borderWidth = borderWidth
        button.layer.cornerRadius = radius
        button.setImage(icon.image(size: size, color: tint), for: .normal)
        button.adjustsImageWhenHighlighted = false
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    public static func padButton(font: UIFont = UIFont.systemFont(ofSize: 18), color: UIColor = UIColor.black, background: UIColor = UIColor.clear, image: UIImage? = nil, title: String = "", alpha: CGFloat = 1.0, radius: CGFloat = 0.0, borderColor: UIColor = .clear, borderWidth: CGFloat = 1.0) -> PadButton {
        let button = PadButton()
        button.uxTitleFont = font
        button.uxTitle = title
        button.uxTitleColor = color
        button.layer.borderWidth = borderWidth
        button.layer.borderColor = borderColor.cgColor
        button.backgroundColor = background
        let atts: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font: font as Any,
            NSAttributedString.Key.foregroundColor: color as Any
        ]
        let attTitle = NSAttributedString(string: title, attributes: atts)
        button.setAttributedTitle(attTitle, for: .normal)
        button.setImage(image, for: .normal)
        button.alpha = alpha
        button.layer.cornerRadius = radius
        button.adjustsImageWhenHighlighted = false
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
}
extension PadButton {
    static func button(output: PadOutput) -> PadButton {
        switch output {
        case .backspace:
            let button = PadButton.padIcon(icon: .leftOpen, tint: ViewProperties.padColor)
            button.padOutput = output
            return button
        default:
            let button = PadButton.padButton(font: ViewProperties.padFont, color: ViewProperties.padColor, background: .clear, title: output.rawValue)
            button.padOutput = output
            return button
        }
    }
}
extension PadButton {
    struct ViewProperties {
        static let padFont: UIFont = UIFont.App.currentFont.fonts.medium
        static let padColor: UIColor = UIColor.App.currentScheme.colors.dark
    }
}
