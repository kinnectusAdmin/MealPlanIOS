//
//  MenuRouter.swift
//  MealPlan
//
//  Created by blakerogers on 3/4/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
import CleanModelViewIntent
struct MenuRouter: RouterLink {
    typealias Link = MenuViewModelLink

    static var route: (MenuViewModelLink.MenuViewState?, MenuViewModelLink.MenuIntent, Router<MenuRouter>) -> Void =
    {
        viewState, intent, router in
        switch intent {
        case .didSelectLogout:
           (router.coordinator as? MenuUseCase)?.logout()
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
