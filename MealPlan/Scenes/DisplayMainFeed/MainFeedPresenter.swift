//
//  MainFeedPresenter.swift
//  MealPlan
//
//  Created by blakerogers on 3/3/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
import CleanModelViewIntent
import MealPlanDomain
struct MainFeedPresenter: PresenterLink {
    typealias Link = MainFeedViewModelLink
    typealias View = MainFeedViewType
    static var action: (MainFeedViewModelLink.ViewStateType?, MainFeedViewModelLink.ViewStateType?, MainFeedViewType) -> Void = { viewState, _, view in
        view.welcomeLabel.text = "Hey whatsup, \n \(viewState?.user.firstName ?? "")"
        view.mainFeedCollectionView.model.accept(MainFeedSectionModel(viewState: defaultViewState))
    }
    static var interaction: (MainFeedViewType, Box<MainFeedViewModelLink.IntentType?>) -> Void = { view, interactor in
        
    }
}
extension MainFeedPresenter {
    static let defaultViewState = MainFeedViewModelLink.ViewStateType.init(events: (0..<3).map { _ in return DiningEvent.defaultEvent}, transferEvents: [], account: StudentAccount.empty, user: MealPlanUser.local)
}
