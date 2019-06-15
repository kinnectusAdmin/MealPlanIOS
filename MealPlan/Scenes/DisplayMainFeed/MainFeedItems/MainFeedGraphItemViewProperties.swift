//
//  MainFeedGraphItemViewProperties.swift
//  MealPlan
//
//  Created by blakerogers on 6/6/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import UIKit
import Utilities
extension MainFeedGraphItem {
    struct ViewProperties {
        static let titleFont: UIFont = UIFont.App.currentFont.fonts.large
        static let titleColor: UIColor = UIColor.App.currentScheme.colors.dark
        static let containerBackgroundColor: UIColor = .white
        static let containerShadowColor: UIColor = UIColor.App.accentColor
        static let containerColors: [CGColor] = UIColor.App.blueScheme.gradient.map { $0.cgColor }
        static let backgroundColor: UIColor = .clear
        static let contentRadius: CGFloat = 10.0
        static let chartFont: UIFont = UIFont.App.currentFont.fonts.small
        static let chartFontColor: UIColor = UIColor.App.currentScheme.colors.dark
        static let averageFont: UIFont = UIFont.App.currentFont.fonts.medium
        static let averageColor: UIColor = UIColor.App.currentScheme.colors.lightest
        static let detailsFont: UIFont = UIFont.App.currentFont.fonts.small
        static let detailsColor: UIColor = UIColor.App.currentScheme.colors.lightest
    }
    struct Layout {
        static let titleEdgeOffset: EdgeOffsets = (0, 5, 0, 0)
        static let containerEdgeOffset: EdgeOffsets = (10, 10, -10, 0)
        static let containerHeight: CGFloat = 300
        static let itemHeight: CGFloat = ViewProperties.titleFont.pointSize + containerEdgeOffset.top + containerHeight
        static let averageTopOffset: CGFloat = 10
        static let detailsBottomOffset: CGFloat = -10
    }
}
