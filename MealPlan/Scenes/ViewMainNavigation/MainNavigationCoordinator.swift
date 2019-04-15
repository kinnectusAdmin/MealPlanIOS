//
//  MainNavigationCoordinator.swift
//  MealPlan
//
//  Created by blakerogers on 3/4/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
import CleanModelViewIntent
final class MainNavigationCoordinator: SceneCoordinator {
    typealias Link = MainNavigationViewModel
    typealias ViewLink = MainNavigationPresenter
    typealias RouteLink = MainNavigationRouter
    var coordinators: [String : Coordinator] = [:]
    var viewModel: MVIViewModelType!
    var presenter: Presenter<ViewLink>!
    var router: Router<MainNavigationRouter>!
}
