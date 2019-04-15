//
//  OnboardItemCoordinator.swift
//  MealPlan
//
//  Created by blakerogers on 3/8/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import CleanModelViewIntent
final class OnboardItemCoordinator: ItemCoordinator {
    var viewModel: ViewModel<OnboardItemViewModel>!
    
    var itemPresenter: ItemPresenter<OnboardItemPresenter>!
    
    typealias Link = OnboardItemViewModel
    
    typealias ItemLink = OnboardItemPresenter
    
}

