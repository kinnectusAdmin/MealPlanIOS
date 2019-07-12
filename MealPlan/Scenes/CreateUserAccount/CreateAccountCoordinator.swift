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
    var parentCoordinator: Coordinator?
    var coordinators: [String : Coordinator] = [:]
    var viewModel: MVIViewModelType!
    var presenter: Presenter<ViewLink>!
    var router: Router<CreateAccountRouter>!
    func controller() -> Controller {
        return presenter?.presentation ?? CreateAccountView()
    }
}
extension CreateAccountCoordinator: CreateAccountUseCase {
    func didSelectLogin() {
        Application.shared.presentLogin()
    }
    func didCreateAccount() {
        Application.shared.presentMainNavigation()
        parentCoordinator?.popCoordinator(CreateAccountCoordinator.identifier)
    }
    func didSelectReturn() {
        controller().remove(animated: true, animation: nil)
    }
    
}
