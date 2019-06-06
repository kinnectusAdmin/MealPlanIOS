//
//  MainFeedEventItemViewModel.swift
//  MealPlan
//
//  Created by blakerogers on 6/5/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
import CleanModelViewIntent
import MealPlanDomain
struct MainFeedEventItemViewModel: ViewModelLink {
    
    typealias Link = MainFeedEventItemViewModelLink
    typealias ResultType = Link.ItemResult
    
    static var serviceHandler: ((ServiceIntent?, MainFeedEventItemViewModelLink.ViewStateType) -> Void)?
    
    static var delegateHandler: ((DelegateIntent?, MainFeedEventItemViewModelLink.ViewStateType) -> Void)?
    
    static var initialIntent: MainFeedEventItemViewModelLink.ItemIntent?
    
    static var intentHandler: (MainFeedEventItemViewModelLink.ItemIntent) -> MainFeedEventItemViewModelLink.ItemResult =
    {
        intent in
        switch intent {
        case let .initial(event):
            return ResultType.initial(event: event)
        }
    }
    static var partialResultHandler: (Result) -> MainFeedEventItemViewModelLink.ItemResult? = {_ in return nil}
    
    static func reduce(viewState: MainFeedEventItemViewModelLink.ItemViewState?, result: MainFeedEventItemViewModelLink.ItemResult?) -> MainFeedEventItemViewModelLink.ItemViewState? {
        switch result {
        case let .initial(event)?:
            return Link.ViewStateType.init(event: event)
        default: return viewState
        }
    }
}
struct MainFeedEventItemViewModelLink: ViewStateIntentLink {
    typealias ViewStateType = ItemViewState
    typealias IntentType = ItemIntent
    typealias ResultType = ItemResult
    enum ItemIntent: Intent, ActionIntent {
        case initial(event: EventType)
    }
    enum ItemResult: Result {
        case initial(event: EventType)
        func reduce(accumViewState: ViewState?) -> ViewState {
            switch self {
            case let .initial(event):
                return ItemViewState(event: event)
            }
        }
    }
    struct ItemViewState: ViewState {
        let event: EventType
        var description: String { return event.description }
        var userImage: String {
            switch event.eventKind ?? .dining {
            case .dining:
                return (event as? DiningEvent)?.user.imageURL ?? ""
            case .conversion:
                return MealPlanUser.local.imageURL
            case .transfer:
                return (event as? TransferEvent)?.sender.imageURL ?? ""
            }
        }
        var date: String { return Date().timeIntervalSince1970.shortDate()}
    }
}
