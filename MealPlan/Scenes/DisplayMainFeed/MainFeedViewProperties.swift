//
//  MainFeedViewProperties.swift
//  MealPlan
//
//  Created by blakerogers on 3/23/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import UIKit
extension MainFeedView {
    struct ViewProperties {
        static let backgroundColor: UIColor = UIColor.App.currentScheme.colors.light
        static let welcomeFont: UIFont = UIFont.App.currentFont.fonts.medium
        static let welcomeColor: UIColor = UIColor.App.currentScheme.colors.dark
        static let welcomeBackground: UIColor = .clear
    }
    struct Layout {
        static let navigationViewHeight: CGFloat = 100
        static let welcomeLabelBottomOffset: CGFloat = 0
        static let welcomeLabelHeight: CGFloat = 100
    }
}
