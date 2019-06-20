//
//  ConversionViewViewProperties.swift
//  MealPlan
//
//  Created by blakerogers on 6/10/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import UIKit
import Utilities

extension ConversionView {
    struct ViewProperties {
        static let title: String = "Conversion"
        static let backgroundColor: UIColor = UIColor.App.currentScheme.colors.light
        static let titleFont: UIFont = UIFont.App.currentFont.fonts.large
        static let titleColor: UIColor = UIColor.App.currentScheme.colors.dark
        static let flexTitleFont: UIFont = UIFont.App.currentFont.fonts.large
        static let flexTitleColor: UIColor = UIColor.App.currentScheme.colors.dark
        static let swipesTitleFont: UIFont = flexTitleFont
        static let swipesTitleColor: UIColor = flexTitleColor
        static let underlineColor: UIColor = UIColor.App.currentScheme.colors.dark
        static let balanceFont: UIFont = UIFont.App.currentFont.fonts.gigantic
        static let balanceColor: UIColor = UIColor.App.currentScheme.colors.dark
        static let sendFont: UIFont = UIFont.App.currentFont.fonts.small
        static let sendColor: UIColor = UIColor.App.currentScheme.colors.dark
        static let conversionFont: UIFont = UIFont.App.currentFont.fonts.medium
        static let conversionColor: UIColor = UIColor.App.currentScheme.colors.dark
        static let containerBorderColor: UIColor = UIColor.App.currentScheme.colors.dark
        static let containerControlBarColor: UIColor = UIColor.App.currentScheme.colors.dark.withAlphaComponent(0.9)
        static let conversionBorderColor: UIColor = UIColor.App.currentScheme.colors.dark
    }
    struct Layout {
        static let titleTopOffset: CGFloat = 50
        static let flexTitleTopOffset: CGFloat = 10
        static let balanceLabelTopOffset: CGFloat = 16
        static let transferControlTopOffset: CGFloat = 8
        static let transferControlSize: CGFloat = 50
        static let sendButtonSize: WidthHeight = (200, 40)
        static let flexBalanceEdgeOffset: EdgeOffsets = (20, 20, 0, 0)
        static let swipesBalanceEdgeOffset: EdgeOffsets = (0, 20, -20, 0)
        static let flexUnderlineSize: WidthHeight = (50, 1)
        static let swipesUnderlineSize: WidthHeight = flexUnderlineSize
        static let flexUnderlineTopOffset: CGFloat = 16
        static let sendButtonTopOffset: CGFloat = 70
        static let controlBarSize: WidthHeight = (30, 4)
        static let controlBarTopOffset: CGFloat = 8
        static let containerHeight: CGFloat = UIScreen.main.bounds.height-50
        static let containerOriginTopOffset: CGFloat = 0
        static let containerRestingTopOffset: CGFloat = -100
        static let containerRadius: CGFloat = 20
        static let sendRadius: CGFloat = Layout.sendButtonSize.height*0.5
        static let searchButtonEdgeOffset: EdgeOffsets = (0, 0, -8, -8)
        static let conversionCollectionTopOffset: CGFloat = 16
        static let conversionSize: WidthHeight = (200, 30)
        static let conversionRadius: CGFloat = conversionSize.height*0.5
        static let numberPadEdgeOffset: EdgeOffsets = (30, 50, -30, 0)
        static let conversionButtonTopOffset: CGFloat = 100
    }
}
