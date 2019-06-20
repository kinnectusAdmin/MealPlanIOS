//
//  MainNavigationViewViewProperties.swift
//  MealPlan
//
//  Created by blakerogers on 6/17/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import UIKit

extension MainNavigationView {
    struct ViewProperties {
        static let backgroundColor: UIColor = UIColor.App.currentScheme.colors.light
        static let welcomeFont: UIFont = UIFont.App.currentFont.fonts.medium
        static let welcomeColor: UIColor = UIColor.App.accentColor.withAlphaComponent(1.0)
        static let welcomeBackground: UIColor = .clear
    }
    struct Layout {
        static let navigationViewHeight: CGFloat = 50
        static let welcomeLabelTopOffset: CGFloat = 20
        static let welcomeLabelHeight: CGFloat = 20
    }
}