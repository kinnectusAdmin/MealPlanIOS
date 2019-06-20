//
//  ConversionHIstoryItemViewModel.swift
//  MealPlan
//
//  Created by blakerogers on 6/4/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
import CleanModelViewIntent
import MealPlanDomain
struct ConversionEventItemViewModel: ItemViewModelLink {
    
    typealias Link = ConversionEventItemViewModelLink
    typealias ResultType = Link.ItemResult
    
    static var initialIntent: ConversionEventItemViewModelLink.ItemIntent?
    
    static var intentHandler: (ConversionEventItemViewModelLink.ItemIntent) -> ConversionEventItemViewModelLink.ItemResult =
    {
        intent in
        switch intent {
        case let .initial(event):
            return ResultType.initial(event: event)
        }
    }
    static var partialResultHandler: (Result) -> ConversionEventItemViewModelLink.ItemResult? = { _ in return nil}
    
    static func reduce(viewState: ConversionEventItemViewModelLink.ItemViewState?, result: ConversionEventItemViewModelLink.ItemResult?) -> ConversionEventItemViewModelLink.ItemViewState? {
        switch result {
        case let .initial(event)?:
            return Link.ItemViewState.init(event: event)
        default: return viewState
        }
    }
}
struct ConversionEventItemViewModelLink: ViewStateIntentLink {
    
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
