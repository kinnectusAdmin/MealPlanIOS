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
    typealias View = MainFeedViewType
    static var action: (MainFeedViewModelLink.ViewStateType?, MainFeedViewModelLink.ViewStateType?, MainFeedViewType) -> Void = { viewState, _, view in
        view.welcomeLabel.text = "Welcome \(viewState?.user.name ?? "")"
        view.mainFeedCollectionView.model.accept(MainFeedSectionModel(viewState: viewState))
    }
    static var interaction: (MainFeedViewType, Box<MainFeedViewModelLink.IntentType?>) -> Void = { view, interactor in
        
    }
}
