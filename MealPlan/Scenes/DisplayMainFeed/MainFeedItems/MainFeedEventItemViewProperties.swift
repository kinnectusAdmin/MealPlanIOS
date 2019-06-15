//
//  MainFeedHistoryItemViewProperties.swift
//  MealPlan
//
//  Created by blakerogers on 3/24/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
import UIKit
extension MainFeedEventItem {
    struct ViewProperties {
        static let descriptionFont: UIFont = UIFont.App.currentFont.fonts.small
        static let descriptionColor: UIColor = UIColor.App.currentScheme.colors.dark
        static let descriptionBackground: UIColor = .clear
        static let descriptionAlignment: NSTextAlignment = .center
        static let descriptionNumberOfLines: Int = 2
        static let dateFont: UIFont = UIFont.App.currentFont.fonts.small
        static let dateColor: UIColor = UIColor.App.currentScheme.colors.dark
        static let dateBackground: UIColor = .clear
    }
    struct Layout {
        static let imageWidth_Height: CGFloat = 40
        static let imageRadius: CGFloat = imageWidth_Height*0.5
        static let imageLeftOffset: CGFloat = 10
        static let descriptionLeftOffset: CGFloat = 30
        static let dateRightOffset: CGFloat = -8
        static let itemHeight: CGFloat = 50
    }
}
