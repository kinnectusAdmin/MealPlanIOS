//
//  MainFeedEventItemViewProperties.swift
//  MealPlan
//
//  Created by blakerogers on 6/6/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import UIKit
import Utilities

extension MainFeedEventsItem {
    struct ViewProperties {
        static let containerBackgroundColor: UIColor = .white
        static let containerShadowColor: UIColor = UIColor.App.accentColor
        static let backgroundColor: UIColor = .clear
        static let contentRadius: CGFloat = 10.0
        static let title: String = "History"
        static let titleFont: UIFont = UIFont.App.currentFont.fonts.large
        static let titleColor: UIColor = UIColor.App.currentScheme.colors.dark
    }
    struct Layout {
        static let titleEdgeOffset: EdgeOffsets = (0, 5, 0, 0)
        static let containerEdgeOffset: EdgeOffsets = (10, 10, -10, 0)
        static let collectionEdgeOffset: EdgeOffsets = (10, 10, -10, 0)
    }
}
