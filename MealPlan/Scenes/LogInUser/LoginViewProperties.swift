//
//  LoginViewProperties.swift
//  MealPlan
//
//  Created by blakerogers on 3/6/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import UIKit
extension LoginView {
    struct ViewProperties {
        static let backgroundColor: UIColor = .clear
        static let loginTitle: String = "Login to App"
        static let loginTitleFont: UIFont = .systemFont(ofSize: 18)
        static let loginTitleColor: UIColor = .white
        static let titleBackground: UIColor = .clear
        static let loginButtonRadius: CGFloat = 25
        static let placeholderColor: UIColor = .gray
        static let emailPlaceholder: String = "Email"
        static let emailColor: UIColor = .black
        static let emailBackground: UIColor = .clear
        static let emailFont: UIFont = UIFont.systemFont(ofSize: 12)
        static let passwordPlaceholder: String = "Password"
        static let passwordColor: UIColor = .black
        static let passwordBackground: UIColor = .clear
        static let passwordFont: UIFont = UIFont.systemFont(ofSize: 12)
        static let loginButtonFont: UIFont = .systemFont(ofSize: 18)
        static let loginButtonTitleColor: UIColor = .white
        static let loginButtonColor: UIColor = UIColor.App.currentScheme.colors.lightest
        static let loginButtonTitle: String = "Log In"
        static let loginButtonHeight: CGFloat = 50
        static let loginContainerRadius: CGFloat = 15
        static let loginContainerColor: UIColor = .white
        static let separationBarColor: UIColor = .gray
        static let separationBarHeight: CGFloat = 1
        static let signUpButtonFont: UIFont = .systemFont(ofSize: 12)
        static let signUpButtonColor: UIColor = .white
        static let signUpButtonBackground: UIColor = .clear
        static let signUpButtonTitle: String = "Sign Up"
    }
}
