//
//  MainFeedCoordinator.swift
//  MealPlan
//
//  Created by blakerogers on 3/3/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
import CleanModelViewIntent
final class MainFeedCoordinator: SceneCoordinator {
    typealias Link = MainFeedViewModel
    typealias ViewLink = MainFeedPresenter
    typealias RouteLink = MainFeedRouter
    var coordinators: [String : Coordinator] = [:]
    var viewModel: MVIViewModelType!
    var presenter: Presenter<ViewLink>!
    var router: Router<MainFeedRouter>!
}
