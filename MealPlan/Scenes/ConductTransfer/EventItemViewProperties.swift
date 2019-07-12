//
//  TransferEventItemViewProperties.swift
//  MealPlan
//
//  Created by blakerogers on 6/7/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import UIKit
import Utilities

extension EventItem {
    struct ViewProperties {
        static let descriptionFont: UIFont = UIFont.App.currentFont.fonts.small
        static let descriptionColor: UIColor = UIColor.App.currentScheme.colors.dark
        static let dateFont: UIFont = UIFont.App.currentFont.fonts.tiny
        static let dateColor: UIColor = UIColor.App.currentScheme.colors.dark
        static let backgroundColor: UIColor = .white
    }
    struct Layout {
        static let itemHeight: CGFloat = 50
        static let avatarSize: CGFloat = 40
        static let avatarRadius: CGFloat = avatarSize*0.5
        static let avatarLeftOffset: CGFloat = 20
        static let descriptionLeftOffset: CGFloat = 10
        static let descriptionWidth: CGFloat = 200
        static let dateRightOffset: CGFloat = -10
    }
}
