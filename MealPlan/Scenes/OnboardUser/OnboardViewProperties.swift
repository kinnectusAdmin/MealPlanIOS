//
//  OnboardViewProperties.swift
//  MealPlan
//
//  Created by blakerogers on 3/6/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import UIKit

extension OnboardView {
    struct ViewProperties {
        static let backgroundColor: UIColor = UIColor.blue.withAlphaComponent(0.6)
        static let appTitle: String = "Meal Plan"
        static let appTitleFont: UIFont = .systemFont(ofSize: 18)
        static let appTitleColor: UIColor = .white
        static let appTitleBackground: UIColor = .clear
        static let appIconWidthHeight: CGFloat = 100
        static let loginButtonTitle: String = "Log In"
        static let loginButtonFont: UIFont = .systemFont(ofSize: 12)
        static let loginButtonTitleColor: UIColor = .white
        static let signUpButtonFont: UIFont = .systemFont(ofSize: 12, weight: .bold)
        static let signUpButtonTitleColor: UIColor = UIColor.App.currentScheme.colors.light
        static let signUpButtonTitle: String = "SIGN UP NOW"
        static let signUpButtonColor: UIColor = .white
        static let signUpButtonRadius: CGFloat = 25
        static let signUpButtonHeight: CGFloat = 50
        static let featureFont: UIFont = .systemFont(ofSize: 20)
        static let featureColor: UIColor = .white
        static let indicatorWidth: CGFloat = 100
        static let indicatorHeight: CGFloat = 30
        static let indicatorCount: Int = 3
        static let indicatorTints: (UIColor, UIColor) = (UIColor.App.currentScheme.colors.lightest, .white)
    }
}
extension OnboardItemView {
    struct ViewProperties {
        static let featureLabelFont: UIFont = .systemFont(ofSize: 18)
        static let featureLabelColor: UIColor = .white
        static let featureBackgroundColor: UIColor = .clear
    }
}
