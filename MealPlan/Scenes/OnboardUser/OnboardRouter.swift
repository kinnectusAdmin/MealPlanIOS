//
//  OnboardRouter.swift
//  MealPlan
//
//  Created by blakerogers on 3/3/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
import CleanModelViewIntent

struct OnboardRouter: RouterLink {
    
    typealias Link = OnboardViewModelLink

    static var route: (OnboardViewModelLink.OnboardViewState?, OnboardViewModelLink.OnboardIntent, Router<OnboardRouter>) -> Void =
    {
        viewState, intent, router in
        switch intent {
        case .didSelectLogin:
            //TODO: Handle Login
            let coordinator = CoordinatorProvider.makeLoginCoordinator()
            coordinator.pushCoordinator(coordinator)
            router.controller.present(controller: coordinator.router.controller, animated: true, arrange: nil)
        case .didSelectSignUp:
            //TODO: Handle Sign up
            let coordinator = CoordinatorProvider.makeCreateAccountCoordinator()
            coordinator.pushCoordinator(coordinator)
            router.controller.present(controller: coordinator.router.controller, animated: true, arrange: nil)
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
