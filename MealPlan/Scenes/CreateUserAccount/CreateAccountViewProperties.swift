//
//  CreateAccountViewProperties.swift
//  MealPlan
//
//  Created by blakerogers on 3/6/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import UIKit
import Utilities

extension CreateAccountView {
    struct ViewProperties {
        static let backgroundColor: UIColor = UIColor.App.currentScheme.colors.light
        static let title: String = "Create Account"
        static let titleFont: UIFont = UIFont.App.currentFont.fonts.large
        static let titleColor: UIColor = UIColor.App.currentScheme.colors.dark
        static let titleBackground: UIColor = .clear
        static let placeholderColor: UIColor = .gray
        static let emailPlaceholder: String = "Email"
        static let emailColor: UIColor = .white
        static let emailBackground: UIColor = .clear
        static let emailFont: UIFont = UIFont.App.currentFont.fonts.medium
        static let passwordPlaceholder: String = "Password"
        static let passwordColor: UIColor = .white
        static let passwordBackground: UIColor = .clear
        static let passwordFont: UIFont = UIFont.App.currentFont.fonts.medium
        static let createButtonTitle: String = "CREATE ACCOUNT"
        static let createButtonFont: UIFont = UIFont.App.currentFont.fonts.large
        static let createButtonTitleColor: UIColor = UIColor.App.currentScheme.colors.dark
        static let createButtonColor: UIColor = .clear
        static let separationBarColor: UIColor = UIColor.App.currentScheme.colors.dark
        static let loginButtonTitle: String = "Log In"
        static let loginButtonFont: UIFont = UIFont.App.currentFont.fonts.tiny
        static let loginButtonTitleColor: UIColor = UIColor.App.currentScheme.colors.dark
        static let alertScreenColor: UIColor = UIColor.App.currentScheme.colors.dark.withAlphaComponent(0.6)
    }
    struct Layout {
        static let createButtonHeight: CGFloat = 50
        static let createButtonRadius: CGFloat = 25
        static let separationBarHeight: CGFloat = 1
        static let loginButtonEdgeOffset: EdgeOffsets = (0, 20, -20, 0)
        static let backButtonEdgeOffset: EdgeOffsets = (20, 20, 0, 0)
        static let accountTitleTopOffset: CGFloat = 50
        static let emailEdgeOffset: EdgeOffsets = (10, 50, -10, 0)
        static let emailBarTopOffset: CGFloat = 10
        static let passwordEdgeOffset: EdgeOffsets = (10, 10, -10, 0)
        static let passwordBarTopOffset: CGFloat = 10
        static let createButtonEdgeOffset: EdgeOffsets = (10, 0, -10, -10)
    }
}
