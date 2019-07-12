//
//  MainFeedAccountViewProperties.swift
//  MealPlan
//
//  Created by blakerogers on 6/6/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import UIKit
import Utilities

extension MainFeedAccountItem {
    struct ViewProperties {
        static let containerBackgroundColor: UIColor = .white
        static let containerShadowColor: UIColor = UIColor.App.accentColor
        static let backgroundColor: UIColor = .clear
        static let contentRadius: CGFloat = 10.0
        static let valueFont: UIFont = UIFont.App.currentFont.fonts.small
        static let valueFontColor: UIColor = UIColor.App.currentScheme.colors.dark
        static let infoFont: UIFont = UIFont.App.currentFont.fonts.small
        static let infoFontColor: UIColor = UIColor.App.currentScheme.colors.dark.withAlphaComponent(0.8)
        static let title: String = "Account"
        static let titleFont: UIFont = UIFont.App.currentFont.fonts.large
        static let titleColor: UIColor = UIColor.App.currentScheme.colors.dark
        static let trendIconColor: UIColor = UIColor.App.currentScheme.colors.dark.withAlphaComponent(0.8)
        static let accountTypeFont: UIFont = UIFont.App.currentFont.fonts.medium
        static let accoutTypeColor: UIColor = UIColor.App.currentScheme.colors.dark.withAlphaComponent(0.8)
    }
    struct Layout {
        static let titleEdgeOffset: EdgeOffsets = (0, 5, 0, 0)
        static let containerEdgeOffset: EdgeOffsets = (20, 10, -20, 0)
        static let swipesAccountTypeEdgeOffset: EdgeOffsets = (20, 20, 0, 0)
        static let flexAccountTypeEdgeOffset: EdgeOffsets = (0, swipesAccountTypeEdgeOffset.top, -20, 0)
        static let valueInfoLabelsTopOffset: CGFloat = 10
        static let trendIconTopOffset: CGFloat = 10
        static let trendIconSize: IconSize = .medium
        static let spaceForTitle: CGFloat = 90
        static let valuesBottomOffset: CGFloat = 16
        static let itemHeight: CGFloat = spaceForTitle + containerEdgeOffset.top + swipesAccountTypeEdgeOffset.top + ViewProperties.accountTypeFont.pointSize +  valueInfoLabelsTopOffset*3 + ViewProperties.valueFont.pointSize*3 + valuesBottomOffset
    }
}
