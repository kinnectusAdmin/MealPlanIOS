//
//  MainFeedPresenter.swift
//  MealPlan
//
//  Created by blakerogers on 3/3/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
import CleanModelViewIntent
struct MainFeedPresenter: PresenterLink {
    typealias Link = MainFeedViewModelLink
    typealias View = MainFeedView
    static var action: (MainFeedViewModelLink.ViewStateType?, MainFeedViewModelLink.ViewStateType?, MainFeedView) -> Void = { viewState, _, view in
        
    }
    static var interaction: (MainFeedView, Box<MainFeedViewModelLink.IntentType?>) -> Void = { view, interactor in
        
    }
}
