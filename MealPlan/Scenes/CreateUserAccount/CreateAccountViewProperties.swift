//
//  CreateAccountViewProperties.swift
//  MealPlan
//
//  Created by blakerogers on 3/6/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import UIKit
extension CreateAccountView {
    struct ViewProperties {
        static let title: String = "Create Account"
        static let titleFont: UIFont = .systemFont(ofSize: 18)
        static let titleColor: UIColor = .white
        static let titleBackground: UIColor = .clear
        static let placeholderColor: UIColor = .gray
        static let emailPlaceholder: String = "Email"
        static let emailColor: UIColor = .white
        static let emailBackground: UIColor = .clear
        static let emailFont: UIFont = UIFont.systemFont(ofSize: 12)
        static let passwordPlaceholder: String = "Password"
        static let passwordColor: UIColor = .white
        static let passwordBackground: UIColor = .clear
        static let passwordFont: UIFont = UIFont.systemFont(ofSize: 12)
        static let createButtonTitle: String = "CREATE ACCOUNT"
        static let createButtonFont: UIFont = .systemFont(ofSize: 12, weight: .bold)
        static let createButtonHeight: CGFloat = 50
        static let createButtonTitleColor: UIColor = UIColor.App.currentScheme.colors.light
        static let createButtonColor: UIColor = .white
        static let createButtonRadius: CGFloat = 25
        static let separationBarColor: UIColor = .white
        static let separationBarHeight: CGFloat = 1
        static let loginButtonTitle: String = "Log In"
        static let loginButtonFont: UIFont = .systemFont(ofSize: 12)
        static let loginButtonTitleColor: UIColor = .white
    }
}
