//
//  MainFeedView.swift
//  MealPlan
//
//  Created by blakerogers on 3/3/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import UIKit
import Utilities
import CleanModelViewIntent
protocol MainFeedViewType: Presentation, Controller {
    var welcomeLabel: UILabel { get set}
}
class MainFeedView: UIViewController, MainFeedViewType {
    var welcomeLabel: UILabel = UILabel.labelWith(font: ViewProperties.welcomeFont, txtColor: ViewProperties.welcomeColor, background: ViewProperties.welcomeBackground, alignment: .center, numberOfLines: 0)
}

