//
//  LoginRouter.swift
//  MealPlan
//
//  Created by blakerogers on 3/3/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
import CleanModelViewIntent
struct LoginRouter: RouterLink {
    typealias Link = LoginViewModelLink
    static var route: (LoginViewModelLink.LoginViewState?, LoginViewModelLink.LoginIntent, Router<LoginRouter>) -> Void =
    {
        viewState, intent, router in
        switch intent {
        case .didSelectReturn:
           (router.coordinator as? LoginUseCase)?.didSelectReturn()
        case .didSelectSignUp:
           (router.coordinator as? LoginUseCase)?.didSelectSignUp()
        case .didAcknowledgeAlert:
            switch viewState?.loginState ?? .none {
            case .loginSucceeded:
                (router.coordinator as? LoginUseCase)?.didLogin()
            default: break
            }
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
