//
//  ConversionViewModel.swift
//  MealPlan
//
//  Created by blakerogers on 3/4/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
import CleanModelViewIntent
import MealPlanDomain
struct ConversionViewModel: ViewModelLink {
    
    typealias Link = ConversionViewModelLink
    typealias ResultType = Link.ResultType
    
    static var serviceHandler: ((ServiceIntent?, ConversionViewModelLink.ViewStateType) -> Void)?
    
    static var delegateHandler: ((DelegateIntent?, ConversionViewModelLink.ViewStateType) -> Void)?
    
    static var initialIntent: ConversionViewModelLink.ConversionIntent?
    
    static var intentHandler: (ConversionViewModelLink.ConversionIntent) -> ConversionViewModelLink.ConversionResult =
    {
        intent in
        switch intent {
        case let .didUpdateFlexAmount(amount):
            return ResultType.updateFlexAmount(amount)
        case let .didUpdateSwipeAmount(amount):
            return ResultType.updateSwipeAmount(amount)
        case .didSwitchConversionMode:
            return ResultType.switchConversionMode
        default: return ResultType.notSet
        }
    }
    
    static var partialResultHandler: (Result) -> ConversionViewModelLink.ConversionResult? = { _ in return nil}
    
    static func reduce(viewState: ConversionViewModelLink.ConversionViewState?, result: ConversionViewModelLink.ConversionResult?) -> ConversionViewModelLink.ConversionViewState? {
        return viewState
    }
    
    
}
struct ConversionViewModelLink: ViewStateIntentLink {
    
    typealias ViewStateType = ConversionViewState
    typealias IntentType = ConversionIntent
    typealias ResultType = ConversionResult
    
    struct ConversionViewState: ViewState {
        let proposedConversion: ConversionEvent
        let flexAmount: Int
        let swipeAmount: Int
        let conversionMode: ConversionMode
        let pastConversions: [ConversionEvent]
    }
    enum ConversionIntent: Intent, ActionIntent, ServiceIntent {
        case didUpdateFlexAmount(Int)
        case didUpdateSwipeAmount(Int)
        case didSwitchConversionMode
        case didInitiateConversion
    }
    enum ConversionResult: Result {
        case notSet
        case updateFlexAmount(Int)
        case updateSwipeAmount(Int)
        case switchConversionMode
    }
    enum ConversionMode {
        case flexToSwipes
        case swipesToFlex
    }
}
