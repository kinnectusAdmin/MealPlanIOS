//
//  MainFeedHistoryItemViewProperties.swift
//  MealPlan
//
//  Created by blakerogers on 3/24/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
import UIKit
extension MainFeedHistoryItem {
    struct ViewProperties {
        static let descriptionFont: UIFont = UIFont.systemFont(ofSize: 16, weight: .light)
        static let descriptionColor: UIColor = .black
        static let descriptionBackground: UIColor = .clear
        static let descriptionAlignment: NSTextAlignment = .center
        static let descriptionNumberOfLines: Int = 2
        static let imageWidth_Height: CGFloat = 50
        static let imageRadius: CGFloat = imageWidth_Height*0.5
        static let dateFont: UIFont = UIFont.systemFont(ofSize: 12, weight: .bold)
        static let dateColor: UIColor = .black
        static let dateBackground: UIColor = .clear
    }
}
