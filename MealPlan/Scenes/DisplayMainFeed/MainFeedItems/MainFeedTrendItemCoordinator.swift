//
//  MainFeedTrendItemCoordinator.swift
//  MealPlan
//
//  Created by blakerogers on 4/11/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
import CleanModelViewIntent
final class MainFeedTrendItemCoordinator: ItemCoordinator {
    typealias Link = MainFeedTrendItemViewModel
    typealias ItemLink = MainFeedTrendItemPresenter
    var viewModel: ViewModel<MainFeedTrendItemViewModel>!
    var itemPresenter: ItemPresenter<MainFeedTrendItemPresenter>!
}

