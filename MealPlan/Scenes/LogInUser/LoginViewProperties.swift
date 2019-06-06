//
//  LoginViewProperties.swift
//  MealPlan
//
//  Created by blakerogers on 3/6/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import UIKit
import Utilities
extension LoginView {
    struct ViewProperties {
        static let backgroundColor: UIColor = UIColor.App.currentScheme.colors.light
        static let loginTitle: String = "Login to App"
        static let loginTitleFont: UIFont = UIFont.App.currentFont.fonts.large
        static let loginTitleColor: UIColor = UIColor.App.currentScheme.colors.dark
        static let titleBackground: UIColor = UIColor.App.currentScheme.colors.light
        static let placeholderColor: UIColor = .gray
        static let emailPlaceholder: String = "Email"
        static let emailColor: UIColor = UIColor.App.currentScheme.colors.dark
        static let emailBackground: UIColor = .clear
        static let emailFont: UIFont = UIFont.App.currentFont.fonts.tiny
        static let passwordPlaceholder: String = "Password"
        static let passwordColor: UIColor = .black
        static let passwordBackground: UIColor = .clear
        static let passwordFont: UIFont = UIFont.App.currentFont.fonts.tiny
        static let loginButtonFont: UIFont = UIFont.App.currentFont.fonts.large
        static let loginButtonTitleColor: UIColor = UIColor.App.currentScheme.colors.dark
        static let loginButtonColor: UIColor = .clear
        static let loginButtonTitle: String = "Log In"
        static let loginContainerShadow: UIColor = UIColor.App.accentColor
        static let loginContainerColor: UIColor = .white
        static let separationBarColor: UIColor = UIColor.App.currentScheme.colors.light
        static let signUpButtonFont: UIFont = UIFont.App.currentFont.fonts.tiny
        static let signUpButtonColor: UIColor = UIColor.App.currentScheme.colors.dark
        static let signUpButtonBackground: UIColor = .clear
        static let signUpButtonTitle: String = "Sign Up"
    }
    struct Layout {
        static let separationBarHeight: CGFloat = 1
        static let loginButtonRadius: CGFloat = 25
        static let loginButtonHeight: CGFloat = 50
        static let loginContainerRadius: CGFloat = 15
        static let signUpButtonEdgeOffset: EdgeOffsets = (0, 10, -10, 0)
        static let backButtonEdgeOffset: CGFloat = 10
        static let loginTitleHeight: CGFloat = 50
        static let loginTitleEdgeOffset: EdgeOffsets = (0, 50, 0, 0)
        static let loginContainerEdgeOffset: EdgeOffsets = (0, 100, 0, 0)
        static let loginContainerWidth_Height: WidthHeight = (300, 225)
        static let emailFieldEdgeOffset: EdgeOffsets = (10, 20, -10, 0)
        static let separatingBarTopOffset: CGFloat = 20
        static let passwordTopOffset: CGFloat = 20
        static let passwordEdgeOffset: EdgeOffsets = (10, 0, -10, 0)
        static let passwordBarTopOffset: CGFloat = 20
        static let loginButtonEdgeOffset: EdgeOffsets = (50, 0, -50, -10)
    }
}
