//
//  HistoryCoordinator.swift
//  MealPlan
//
//  Created by blakerogers on 3/3/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
import CleanModelViewIntent
final class HistoryCoordinator: SceneCoordinator {
    typealias Link = HistoryViewModel
    typealias ViewLink = HistoryPresenter
    typealias RouteLink = HistoryRouter
    var coordinators: [String : Coordinator] = [:]
    var viewModel: MVIViewModelType!
    var presenter: Presenter<ViewLink>!
    var router: Router<HistoryRouter>!
    func controller() -> Controller {
        return HistoryView()
    }
}
