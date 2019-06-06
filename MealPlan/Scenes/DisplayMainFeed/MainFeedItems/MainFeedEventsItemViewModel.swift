//
//  MainFeedHistoryItemViewModel.swift
//  MealPlan
//
//  Created by blakerogers on 3/23/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
import CleanModelViewIntent
import MealPlanDomain

struct MainFeedEventsItemViewModel: ViewModelLink {

    typealias Link = MainFeedEventsItemViewModelLink
    typealias ResultType = Link.ItemResult
    
    static var serviceHandler: ((ServiceIntent?, MainFeedEventsItemViewModelLink.ViewStateType) -> Void)?
    
    static var delegateHandler: ((DelegateIntent?, MainFeedEventsItemViewModelLink.ViewStateType) -> Void)?
    
    static var initialIntent: MainFeedEventsItemViewModelLink.ItemIntent?
    
    static var intentHandler: (MainFeedEventsItemViewModelLink.ItemIntent) -> MainFeedEventsItemViewModelLink.ItemResult =
    {
        intent in
        switch intent {
        case let .initial(events):
            return ResultType.initial(events: events)
        }
    }
    static var partialResultHandler: (Result) -> MainFeedEventsItemViewModelLink.ItemResult? = {_ in return nil}
    
    static func reduce(viewState: MainFeedEventsItemViewModelLink.ItemViewState?, result: MainFeedEventsItemViewModelLink.ItemResult?) -> MainFeedEventsItemViewModelLink.ItemViewState? {
        switch result {
        case let .initial(events)?:
            return Link.ViewStateType.init(events: events)
        default: return viewState
        }
    }
}
struct MainFeedEventsItemViewModelLink: ViewStateIntentLink {
    typealias ViewStateType = ItemViewState
    typealias IntentType = ItemIntent
    typealias ResultType = ItemResult
    enum ItemIntent: Intent, ActionIntent {
        case initial(events: [EventType])
    }
    enum ItemResult: Result {
        case initial(events: [EventType])
        func reduce(accumViewState: ViewState?) -> ViewState {
            switch self {
            case let .initial(events):
                return ItemViewState(events: events)
            }
        }
    }
    struct ItemViewState: ViewState {
        let events: [EventType]
    }
}

