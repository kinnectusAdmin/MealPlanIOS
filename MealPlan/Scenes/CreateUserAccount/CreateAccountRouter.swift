//
//  CreateAccountRouter.swift
//  MealPlan
//
//  Created by blakerogers on 3/3/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
import CleanModelViewIntent
struct CreateAccountRouter: RouterLink {
    
    typealias Link = CreateAccountViewModelLink

    static var route: (CreateAccountViewModelLink.CreateAccountViewState?, CreateAccountViewModelLink.CreateAccountIntent, Router<CreateAccountRouter>) -> Void =
    {
        viewState, intent, router in
        switch intent {
        case .didSelectLogin:
            //TODO: Handle Login
            let coordinator = CoordinatorProvider.makeLoginCoordinator()
            coordinator.pushCoordinator(coordinator)
            router.controller.present(controller: coordinator.router.controller, animated: true, arrange: nil)
        case .didSelectReturn:
            //TODO: Handle return
            router.controller.remove(animated: true, animation: nil)
        default: break
        }
    }
    static var onDismiss: () -> Void =
    {
        
    }
    
    static var onDismissWithInfo: (RouterInfo) -> Void =
    {
        info in
    }
}
