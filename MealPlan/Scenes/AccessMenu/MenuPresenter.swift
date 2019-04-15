//
//  MenuPresenter.swift
//  MealPlan
//
//  Created by blakerogers on 3/4/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
import CleanModelViewIntent
struct MenuPresenter: PresenterLink {
    typealias Link = MenuViewModelLink
    typealias View = MenuView
    static var action: (Link.ViewStateType?, Link.ViewStateType?, View) -> Void = { state, _,view in
        
    }
    static var interaction: (MenuView, Box<Link.IntentType?>) -> Void = { view, interactor in
        
    }
    
}
