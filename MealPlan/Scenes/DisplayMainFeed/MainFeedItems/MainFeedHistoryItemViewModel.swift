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
struct TransferEventHistoryItemViewModel: ViewModelLink {
    
    typealias Link = TransferEventHistoryItemViewModelLink
    typealias ResultType = Link.ItemResult
    
    static var serviceHandler: ((ServiceIntent?, TransferEventHistoryItemViewModelLink.ViewStateType) -> Void)?
    
    static var delegateHandler: ((DelegateIntent?, TransferEventHistoryItemViewModelLink.ViewStateType) -> Void)?
    
    static var initialIntent: TransferEventHistoryItemViewModelLink.ItemIntent?
    
    static var intentHandler: (TransferEventHistoryItemViewModelLink.ItemIntent) -> TransferEventHistoryItemViewModelLink.ItemResult =
    {
        intent in
        switch intent {
        case let .initial(event):
            return ResultType.initial(event: event)
        }
    }
    static var partialResultHandler: (Result) -> TransferEventHistoryItemViewModelLink.ItemResult? =
    { _ in
    return nil
    }
    
    static func reduce(viewState: TransferEventHistoryItemViewModelLink.ItemViewState?, result: TransferEventHistoryItemViewModelLink.ItemResult?) -> TransferEventHistoryItemViewModelLink.ItemViewState? {
        return viewState
    }
}
struct TransferEventHistoryItemViewModelLink: ViewStateIntentLink {
    typealias ViewStateType = ItemViewState
    typealias IntentType = ItemIntent
    typealias ResultType = ItemResult
    
    enum ItemIntent: Intent, ActionIntent {
        case initial(event: TransferEvent)
    }
    enum ItemResult: Result {
        case notSet
        case initial(event: TransferEvent)
    }
    struct ItemViewState: ViewState {
        let event: TransferEvent
        var otherUser: EventUser { return event.receiver.id != "" ? event.receiver : event.sender}
        var userImage: String { return otherUser.imageURL}
        var eventDescription: String { return event.description}
        var eventDate: String { return event.date.shortDate()}
    }
}
struct DiningEventHistoryItemViewModel: ViewModelLink {

    typealias Link = DiningEventHistoryItemViewModelLink
    typealias ResultType = Link.ItemResult
    
    static var serviceHandler: ((ServiceIntent?, DiningEventHistoryItemViewModelLink.ViewStateType) -> Void)?
    
    static var delegateHandler: ((DelegateIntent?, DiningEventHistoryItemViewModelLink.ViewStateType) -> Void)?
    
    static var initialIntent: DiningEventHistoryItemViewModelLink.ItemIntent?
    
    static var intentHandler: (DiningEventHistoryItemViewModelLink.ItemIntent) -> DiningEventHistoryItemViewModelLink.ItemResult =
    {
        intent in
        switch intent {
        case let .initial(event):
            return ResultType.initial(event: event)
        }
    }
    static var partialResultHandler: (Result) -> DiningEventHistoryItemViewModelLink.ItemResult? = {_ in return nil}
    
    static func reduce(viewState: DiningEventHistoryItemViewModelLink.ItemViewState?, result: DiningEventHistoryItemViewModelLink.ItemResult?) -> DiningEventHistoryItemViewModelLink.ItemViewState? {
        return viewState
    }
}
struct DiningEventHistoryItemViewModelLink: ViewStateIntentLink {
    typealias ViewStateType = ItemViewState
    typealias IntentType = ItemIntent
    typealias ResultType = ItemResult
    enum ItemIntent: Intent {
        case initial(event: DiningEvent)
    }
    enum ItemResult: Result {
        case initial(event: DiningEvent)
        func reduce(accumViewState: ViewState?) -> ViewState {
            switch self {
            case let .initial(event):
                return ItemViewState(event: event)
            }
        }
    }
    struct ItemViewState: ViewState {
        let event: DiningEvent
        var userImage: String { return event.user.imageURL}
        var eventDescription: String { return event.description}
        var eventDate: String { return event.date.shortDate()}
    }
}
struct ConversionEventHistoryItemViewModel: ViewModelLink {
    
    typealias Link = ConversionEventHistoryItemViewModelLink
    typealias ResultType = Link.ItemResult
    
    static var serviceHandler: ((ServiceIntent?, ConversionEventHistoryItemViewModelLink.ViewStateType) -> Void)?
    
    static var delegateHandler: ((DelegateIntent?, ConversionEventHistoryItemViewModelLink.ViewStateType) -> Void)?
    
    static var initialIntent: ConversionEventHistoryItemViewModelLink.ItemIntent?
    
    static var intentHandler: (ConversionEventHistoryItemViewModelLink.ItemIntent) -> ConversionEventHistoryItemViewModelLink.ItemResult =
    {
        intent in
        switch intent {
        case let .initial(event):
            return ResultType.initial(event: event)
        }
    }
    static var partialResultHandler: (Result) -> ConversionEventHistoryItemViewModelLink.ItemResult? = { _ in return nil}
    
    static func reduce(viewState: ConversionEventHistoryItemViewModelLink.ItemViewState?, result: ConversionEventHistoryItemViewModelLink.ItemResult?) -> ConversionEventHistoryItemViewModelLink.ItemViewState? {
        return viewState
    }
    
    
}
struct ConversionEventHistoryItemViewModelLink: ViewStateIntentLink {
    typealias ViewStateType = ItemViewState
    typealias IntentType = ItemIntent
    typealias ResultType = ItemResult
    
    enum ItemIntent: Intent {
        case initial(event: ConversionEvent)
    }
    enum ItemResult: Result {
        case initial(event: ConversionEvent)
    }
    struct ItemViewState: ViewState {
        let event: ConversionEvent
        var eventDescription: String { return event.description}
        var eventDate: String { return event.date.shortDate()}
    }
}
