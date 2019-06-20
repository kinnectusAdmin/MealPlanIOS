//
//  MenuViewProperties.swift
//  MealPlan
//
//  Created by blakerogers on 6/14/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import UIKit
import Utilities

extension MenuView {
    struct ViewProperties {
        static let background: UIColor = UIColor.App.currentScheme.colors.light
        static let containerBackground: UIColor = UIColor.white.withAlphaComponent(0.5)
        static let containerBorderColor: UIColor = UIColor.App.currentScheme.colors.dark
        static let nameFont: UIFont = UIFont.App.currentFont.fonts.medium
        static let nameColor: UIColor = UIColor.App.currentScheme.colors.dark
        static let infoFont: UIFont = UIFont.App.currentFont.fonts.small
        static let infoColor: UIColor = UIColor.App.currentScheme.colors.dark
        static let logoutFont: UIFont = UIFont.App.currentFont.fonts.small
        static let logoutColor: UIColor = UIColor.App.currentScheme.colors.dark
    }
    struct Layout {
        static let containerRadius: CGFloat = 20
        static let containerHeight: CGFloat = UIScreen.main.bounds.height-50
        static let containerOriginTopOffset: CGFloat = -containerHeight+20
        static let containerOffsetLimit: CGFloat = -containerHeight+50
        static let profileImageSize: CGFloat = 100
        static let profileImageRadius: CGFloat = profileImageSize*0.5
        static let imageTopOffset: CGFloat = 50
        static let nameTopOffset: CGFloat = 50
        static let infoTopOffset: CGFloat = 20
        static let logoutBottomOffset: CGFloat = -100
        static let dismissTopOffset: CGFloat = 20
    }
}
