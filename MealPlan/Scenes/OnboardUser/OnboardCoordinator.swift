//
//  OnboardCoordinator.swift
//  MealPlan
//
//  Created by blakerogers on 3/1/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
import CleanModelViewIntent
final class OnboardCoordinator: SceneCoordinator {
    typealias Link = OnboardViewModel
    typealias ViewLink = OnboardPresenter
    typealias RouteLink = OnboardRouter
    var parentCoordinator: Coordinator?
    var coordinators: [String : Coordinator] = [:]
    var viewModel: MVIViewModelType!
    var presenter: Presenter<ViewLink>!
    var router: Router<OnboardRouter>!
    func controller() -> Controller {
        return presenter?.presentation ?? OnboardView()
    }
}
extension OnboardCoordinator: OnboardUseCase {
    func didSelectSignUp() {
        Application.shared.presentCreateAccount()
    }
    func didSelectLogin() {
        Application.shared.presentLogin()
    }
}
