//
//  TransferEventItemViewModel.swift
//  MealPlan
//
//  Created by blakerogers on 6/4/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
import CleanModelViewIntent
import MealPlanDomain

struct TransferEventItemViewModel: ViewModelLink {
    
    typealias Link = TransferEventItemViewModelLink
    typealias ResultType = Link.ItemResult
    
    static var serviceHandler: ((ServiceIntent?, TransferEventItemViewModelLink.ViewStateType) -> Void)?
    
    static var delegateHandler: ((DelegateIntent?, TransferEventItemViewModelLink.ViewStateType) -> Void)?
    
    static var initialIntent: TransferEventItemViewModelLink.ItemIntent?
    
    static var intentHandler: (TransferEventItemViewModelLink.ItemIntent) -> TransferEventItemViewModelLink.ItemResult =
    {
        intent in
        switch intent {
        case let .initial(event):
            return ResultType.initial(event: event)
        }
    }
    static var partialResultHandler: (Result) -> TransferEventItemViewModelLink.ItemResult? =
    { _ in
        return nil
    }
    
    static func reduce(viewState: TransferEventItemViewModelLink.ItemViewState?, result: TransferEventItemViewModelLink.ItemResult?) -> TransferEventItemViewModelLink.ItemViewState? {
        switch result {
        case let .initial(event)?:
            return Link.ItemViewState(event: event)
        default: return viewState
        }
    }
}
struct TransferEventItemViewModelLink: ViewStateIntentLink {
    typealias ViewStateType = ItemViewState
    typealias IntentType = ItemIntent
    typealias ResultType = ItemResult
    
    enum ItemIntent: Intent, ActionIntent {
        case initial(event: TransferEvent)
    }
    enum ItemResult: Result {
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
