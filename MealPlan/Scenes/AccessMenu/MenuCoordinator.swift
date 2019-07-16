//
//  MenuCoordinator.swift
//  MealPlan
//
//  Created by blakerogers on 3/4/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
import CleanModelViewIntent
final class MenuCoordinator: SceneCoordinator {
    typealias Link = MenuViewModel
    typealias ViewLink = MenuPresenter
    typealias RouteLink = MenuRouter
    var parentCoordinator: Coordinator?
    var coordinators: [String : Coordinator] = [:]
    var viewModel: MVIViewModelType!
    var presenter: Presenter<ViewLink>!
    var router: Router<MenuRouter>!
    func controller() -> Controller {
        return presenter?.presentation ?? MenuView()
    }
}
extension MenuCoordinator: MenuUseCase {
    func logout() {
        Application.shared.logout()
    }
}
