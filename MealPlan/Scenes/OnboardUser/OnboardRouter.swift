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
            (router.coordinator as? OnboardUseCase)?.didSelectLogin()
        case .didSelectSignUp:
            (router.coordinator as? OnboardUseCase)?.didSelectSignUp()
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
