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
        static let backgroundColor: UIColor = UIColor.App.currentScheme.colors.light
        static let appTitle: String = "Meal Plan"
        static let appTitleFont: UIFont =  UIFont.App.currentFont.fonts.large
        static let appTitleColor: UIColor = UIColor.App.currentScheme.colors.dark
        static let appTitleBackground: UIColor = .clear
        static let loginButtonTitle: String = "Log In"
        static let loginButtonFont: UIFont = UIFont.App.currentFont.fonts.tiny
        static let loginButtonTitleColor: UIColor = UIColor.App.currentScheme.colors.dark
        static let signUpButtonFont: UIFont = UIFont.App.currentFont.fonts.tiny
        static let signUpButtonTitleColor: UIColor = UIColor.App.currentScheme.colors.dark
        static let signUpButtonTitle: String = "SIGN UP NOW"
        static let signUpButtonColor: UIColor = .clear
        static let featureFont: UIFont = UIFont.App.currentFont.fonts.large
        static let featureColor: UIColor = .white
        static let indicatorCount: Int = 3
        static let indicatorTints: (UIColor, UIColor) = (UIColor.App.currentScheme.colors.lightest, .white)
    }
    struct Layout {
        static let appIconWidthHeight: CGFloat = 100
        static let appIconTopOffset: CGFloat = 10
        static let indicatorWidth: CGFloat = 100
        static let indicatorHeight: CGFloat = 30
        static let signUpButtonRadius: CGFloat = 25
        static let signUpButtonHeight: CGFloat = 50
        static let signUpButtonEdgeOffset: CGFloat = 10
        static let loginButtonEdgeOffset: CGFloat = 20
        static let appTitleTopOffset: CGFloat = 100
        static let collectionBottomOffset: CGFloat = -100
        static let collectionTopOffset: CGFloat = 10
    }
}
extension OnboardItemView {
    struct ViewProperties {
        static let featureLabelFont: UIFont = UIFont.App.currentFont.fonts.medium
        static let featureLabelColor: UIColor = UIColor.App.currentScheme.colors.dark
        static let featureBackgroundColor: UIColor = .clear
    }
}
