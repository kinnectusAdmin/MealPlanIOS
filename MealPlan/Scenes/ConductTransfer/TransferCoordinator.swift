//
//  TransferCoordinator.swift
//  MealPlan
//
//  Created by blakerogers on 3/4/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
import CleanModelViewIntent
final class TransferCoordinator: SceneCoordinator {
    typealias Link = TransferViewModel
    typealias ViewLink = TransferPresenter
    typealias RouteLink = TransferRouter
    var parentCoordinator: Coordinator?
    var coordinators: [String : Coordinator] = [:]
    var viewModel: MVIViewModelType!
    var presenter: Presenter<TransferPresenter>!
    var router: Router<TransferRouter>!
    func controller() -> Controller {
        return presenter?.presentation ?? TransferView()
    }
}
