//
//  MainNavigationViewType.swift
//  MealPlan
//
//  Created by blakerogers on 6/17/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import UIKit
import CleanModelViewIntent
protocol MainNavigationViewType: Presentation, Controller {
    var welcomeLabel: UILabel { get set}
    var navigationView: NavigationView { get set }
    func setController(controller: UIViewController?, isForward: Bool)
}
