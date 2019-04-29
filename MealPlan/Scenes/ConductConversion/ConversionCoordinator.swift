//
//  ConversionCoordinator.swift
//  MealPlan
//
//  Created by blakerogers on 3/4/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
import CleanModelViewIntent
final class ConversionCoordinator: SceneCoordinator {
    typealias Link = ConversionViewModel
    typealias ViewLink = ConversionPresenter
    typealias RouteLink = ConversionRouter
    var coordinators: [String : Coordinator] = [:]
    var viewModel: MVIViewModelType!
    var presenter: Presenter<ViewLink>!
    var router: Router<ConversionRouter>!
    func controller() -> Controller {
        return ConversionView()
    }
}
