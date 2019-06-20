//
//  LoginCoordinator.swift
//  MealPlan
//
//  Created by blakerogers on 3/3/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
import CleanModelViewIntent
final class LoginCoordinator: SceneCoordinator {
    typealias Link = LoginViewModel
    typealias ViewLink = LoginPresenter
    typealias RouteLink = LoginRouter
    var parentCoordinator: Coordinator?
    var coordinators: [String : Coordinator] = [:]
    var viewModel: MVIViewModelType!
    var presenter: Presenter<ViewLink>!
    var router: Router<LoginRouter>!
    func controller() -> Controller {
        return LoginView()
    }
}
