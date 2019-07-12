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
import MealPlanNetwork

struct ConversionViewModel: ViewModelLink {
    
    typealias Link = ConversionViewModelLink
    typealias ResultType = Link.ResultType
    typealias ServiceType = MealPlanNetwork.EventUseCase
    typealias DelegateType = NilDelegateType
    
    static var serviceHandler: ((ConversionViewModelLink.ConversionIntent, ConversionViewModelLink.ConversionViewState, ServiceType?) -> Void)? =
    {
        intent, viewState, service in
        switch intent {
        case .initial:
            service?.fetchConversionEvents(userID: MealPlanUser.local.uid)
        default: break
        }
    }
    static var delegateHandler: ((ConversionViewModelLink.ConversionIntent, ConversionViewModelLink.ConversionViewState, NilDelegateType?) -> Void)?
    
    static var initialIntent: ConversionViewModelLink.ConversionIntent? = .initial
    
    static var intentHandler: ((ConversionViewModelLink.ConversionIntent) -> ConversionViewModelLink.ConversionResult)? =
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
    
    static var partialResultHandler: ((Result) -> ConversionViewModelLink.ConversionResult?)? =
    {
        result in
        switch result as? MealPlanNetwork.EventNetwork.EventNetworkResult {
        case let .didFetchConversionEvents(events)?:
            return ResultType.updateConversionEvents(events)
        default: return nil
        }
    }
    
    static func reduce(viewState: ConversionViewModelLink.ConversionViewState?, result: ConversionViewModelLink.ConversionResult?) -> ConversionViewModelLink.ConversionViewState? {
        guard let state = viewState else { return Link.ViewStateType.empty}
        switch result {
        case .initial?:
            return Link.ViewStateType.init(proposedConversion: ConversionEvent.empty, flexAmount: 0, swipeAmount: 0, conversionMode: .swipesToFlex, pastConversions: [])
        case let .updateFlexAmount(amount)?:
            return Link.ViewStateType.init(proposedConversion: state.proposedConversion, flexAmount: amount, swipeAmount: state.swipeAmount, conversionMode: state.conversionMode, pastConversions: state.pastConversions)
        case let .updateSwipeAmount(amount)?:
            return Link.ViewStateType.init(proposedConversion: state.proposedConversion, flexAmount: state.flexAmount, swipeAmount: amount, conversionMode: state.conversionMode, pastConversions: state.pastConversions)
        case let .updateConversionEvents(events)?:
            return Link.ViewStateType.init(proposedConversion: state.proposedConversion, flexAmount: state.flexAmount, swipeAmount: state.swipeAmount, conversionMode: state.conversionMode, pastConversions: events)
        case .switchConversionMode?:
            return Link.ViewStateType.init(proposedConversion: state.proposedConversion, flexAmount: state.flexAmount, swipeAmount: state.swipeAmount, conversionMode: state.conversionMode.alternate, pastConversions: state.pastConversions)
        default: return viewState
        }
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
        var flexText: String { return "\(flexAmount)"}
        var swipeText: String { return "\(swipeAmount)"}
        static let empty: ConversionViewState = ConversionViewState(proposedConversion: ConversionEvent.empty, flexAmount: 0, swipeAmount: 0, conversionMode: .swipesToFlex, pastConversions: [])
    }
    enum ConversionIntent: Intent, ActionIntent, ServiceIntent {
        case initial
        case didUpdateFlexAmount(Int)
        case didUpdateSwipeAmount(Int)
        case didSwitchConversionMode
        case didInitiateConversion
    }
    enum ConversionResult: Result {
        case notSet
        case initial
        case updateFlexAmount(Int)
        case updateSwipeAmount(Int)
        case updateConversionEvents([ConversionEvent])
        case switchConversionMode
    }
    enum ConversionMode {
        case flexToSwipes
        case swipesToFlex
        var alternate: ConversionMode {
            switch self {
            case .flexToSwipes: return .swipesToFlex
            case .swipesToFlex: return .flexToSwipes
            }
        }
    }
}
