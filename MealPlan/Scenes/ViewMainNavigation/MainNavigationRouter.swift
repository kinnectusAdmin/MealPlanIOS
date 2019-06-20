//
//  MainNavigationRouter.swift
//  MealPlan
//
//  Created by blakerogers on 3/4/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
import CleanModelViewIntent
struct MainNavigationRouter: RouterLink {
    typealias Link = MainNavigationViewModelLink

    static var route: (MainNavigationViewModelLink.MainNavigationViewState?, MainNavigationViewModelLink.MainNavigationIntent, Router<MainNavigationRouter>) -> Void =
    {
        viewState, intent, router in
        switch intent {
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
