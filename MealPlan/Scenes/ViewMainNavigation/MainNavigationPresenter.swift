//
//  MainNavigationPresenter.swift
//  MealPlan
//
//  Created by blakerogers on 3/4/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
import Foundation
import CleanModelViewIntent
struct MainNavigationPresenter: PresenterLink {
    typealias Link = MainNavigationViewModelLink
    typealias View = MainNavigationView
    static var action: (Link.ViewStateType?, Link.ViewStateType?, View) -> Void = { state, _,view in
        
    }
    static var interaction: (MainNavigationView, Box<Link.IntentType?>) -> Void = { view, interactor in
        
    }
}
