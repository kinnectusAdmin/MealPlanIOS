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
    var mainFeedCollectionView: UXCollectionView<MainFeedSectionModel> { get set}
}
