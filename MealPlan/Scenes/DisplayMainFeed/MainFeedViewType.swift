//
//  MainFeedViewType.swift
//  MealPlan
//
//  Created by blakerogers on 5/19/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import UIKit
import Utilities
import CleanModelViewIntent
protocol MainFeedViewType: Presentation, Controller {
    var welcomeLabel: UILabel { get set}
    var navigationView: NavigationView { get set}
    var mainFeedCollectionView: UXCollectionView<MainFeedSectionModel> { get set}
}
