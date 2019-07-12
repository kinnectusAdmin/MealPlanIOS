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
        guard let state = viewState else { return }
        switch intent {
        case .didSelectLogin:
           (router.coordinator as? CreateAccountUseCase)?.didSelectLogin()
        case .didSelectReturn:
            (router.coordinator as? CreateAccountUseCase)?.didSelectReturn()
        case .didAcknowledgeAlert:
            switch state.createAccountState {
            case .signUpSucceeded:
                (router.coordinator as? CreateAccountUseCase)?.didCreateAccount()
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
