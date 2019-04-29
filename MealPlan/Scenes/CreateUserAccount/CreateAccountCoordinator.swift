//
//  CreateAccountCoordinator.swift
//  MealPlan
//
//  Created by blakerogers on 3/3/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
import CleanModelViewIntent
final class CreateAccountCoordinator: SceneCoordinator {
    typealias Link = CreateAccountViewModel
    typealias ViewLink = CreateAccountPresenter
    typealias RouteLink = CreateAccountRouter
    var coordinators: [String : Coordinator] = [:]
    var viewModel: MVIViewModelType!
    var presenter: Presenter<ViewLink>!
    var router: Router<CreateAccountRouter>!
    func controller() -> Controller {
        return CreateAccountView()
    }
}
