//
//  HIstoryPresenter.swift
//  MealPlan
//
//  Created by blakerogers on 3/3/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
import CleanModelViewIntent
struct HistoryPresenter: PresenterLink {
    typealias Link = HistoryViewModelLink
    typealias View = HistoryView
    static var action: (Link.ViewStateType?, Link.ViewStateType?, View) -> Void = { state, _, view in
        
    }
    static var interaction: (HistoryView, Box<Link.IntentType?>) -> Void = { view, interactor in
        
    }
    
}
