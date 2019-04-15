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
            router.controller.remove(animated: true, animation: nil)
        case .didSelectSignUp:
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
