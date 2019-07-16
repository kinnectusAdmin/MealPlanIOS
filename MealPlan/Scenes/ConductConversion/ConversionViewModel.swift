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
        case .didVerifyConversionRequest:
            service?.recordConversion(conversion: viewState.proposedConversion)
        default: break
        }
    }
    static var delegateHandler: ((ConversionViewModelLink.ConversionIntent, ConversionViewModelLink.ConversionViewState, NilDelegateType?) -> Void)?
    
    static var initialIntent: ConversionViewModelLink.ConversionIntent? = .initial
    
    static var intentHandler: ((ConversionViewModelLink.ConversionIntent) -> ConversionViewModelLink.ConversionResult)? =
    {
        intent in
        switch intent {
        case let .didUpdateAmount(amount):
            return ResultType.updateConversionAmount(amount)
        case .didSwitchConversionMode:
            return ResultType.switchConversionMode
        case .didInitiateConversion:
            return ResultType.verifyConversion
        case .didDeclineConversion:
            return ResultType.dismissConversionRequest
        case .didVerifyConversionRequest:
            return ResultType.beginConversion
        case .didAcknowledgeAlert:
            return ResultType.acknowledgeAlert
        default: return ResultType.notSet
        }
    }
    
    static var partialResultHandler: ((Result) -> ConversionViewModelLink.ConversionResult?)? =
    {
        result in
        switch result as? MealPlanNetwork.EventNetwork.EventNetworkResult {
        case let .didFetchConversionEvents(events)?:
            return ResultType.updateConversionEvents(events)
        case .didRecordConversion?:
            return ResultType.conversionSuceeded
        case .recordConversionFailure?:
            return ResultType.conversionFailed
        default: return nil
        }
    }
    
    static func reduce(viewState: ConversionViewModelLink.ConversionViewState?, result: ConversionViewModelLink.ConversionResult?) -> ConversionViewModelLink.ConversionViewState? {
        guard let state = viewState else { return Link.ViewStateType.empty}
        switch result {
        case .initial?:
            return Link.ViewStateType.init(conversionMode: .swipesToFlex(amount: 0), pastConversions: [], conversionRequestState: .notDisplayed, conversionResultState: .notSet)
        case let .updateConversionAmount(amount)?:
            switch state.conversionMode {
            case .flexToSwipes:
                let conversionAmount = PadOutput.outputFor(currentInput: state.flexText, input: PadOutput(rawValue: amount) ?? .none)
                return Link.ViewStateType.init( conversionMode: .flexToSwipes(amount: Int(conversionAmount) ?? 0), pastConversions: state.pastConversions, conversionRequestState: state.conversionRequestState, conversionResultState: state.conversionResultState)
            case .swipesToFlex:
                let conversionAmount = PadOutput.outputFor(currentInput: state.swipeText, input: PadOutput(rawValue: amount) ?? .none)
                return Link.ViewStateType.init( conversionMode: .swipesToFlex(amount: Int(conversionAmount) ?? 0), pastConversions: state.pastConversions, conversionRequestState: state.conversionRequestState, conversionResultState: state.conversionResultState)
            }
        
        case let .updateConversionEvents(events)?:
            return Link.ViewStateType.init( conversionMode: state.conversionMode, pastConversions: events, conversionRequestState: state.conversionRequestState, conversionResultState: state.conversionResultState)
        case .switchConversionMode?:
            return Link.ViewStateType.init( conversionMode: state.conversionMode.alternate, pastConversions: state.pastConversions, conversionRequestState: state.conversionRequestState, conversionResultState: state.conversionResultState)
        case .verifyConversion?:
            if state.conversionMode.amount > 0 && state.conversionMode.amountForConversion() > 0 {
                return Link.ViewStateType.init( conversionMode: state.conversionMode, pastConversions: state.pastConversions, conversionRequestState: .display, conversionResultState: .notSet)
            } else {
                return Link.ViewStateType.init( conversionMode: state.conversionMode, pastConversions: state.pastConversions, conversionRequestState: .notDisplayed, conversionResultState: .error(message: "Invalid Conversion Amount: \n Must be between 1 to 10 swipes / flex points"))
            }
        case .beginConversion?:
            return Link.ViewStateType.init( conversionMode: state.conversionMode, pastConversions: state.pastConversions, conversionRequestState: .notDisplayed, conversionResultState: .loading)
        case .conversionSuceeded?:
            return Link.ViewStateType.init( conversionMode: .swipesToFlex(amount: 0), pastConversions: state.pastConversions, conversionRequestState: .notDisplayed, conversionResultState: .success)
        case .conversionFailed?:
            return Link.ViewStateType.init( conversionMode: state.conversionMode, pastConversions: state.pastConversions, conversionRequestState: .notDisplayed, conversionResultState: .error(message: "Could not complete Conversion"))
        case .dismissConversionRequest?:
            return Link.ViewStateType.init( conversionMode: state.conversionMode, pastConversions: state.pastConversions, conversionRequestState: .notDisplayed, conversionResultState: .notSet)
        case .acknowledgeAlert?:
            return Link.ViewStateType.init( conversionMode: state.conversionMode, pastConversions: state.pastConversions, conversionRequestState: .notDisplayed, conversionResultState: .notSet)
        default: return viewState
        }
    }
}
struct ConversionViewModelLink: ViewStateIntentLink {
    
    typealias ViewStateType = ConversionViewState
    typealias IntentType = ConversionIntent
    typealias ResultType = ConversionResult
    
    
    struct ConversionViewState: ViewState {
        let conversionMode: ConversionMode
        let pastConversions: [ConversionEvent]
        let conversionRequestState: DisplayState
        let conversionResultState: ResultState
        var flexText: String {
            switch conversionMode {
            case let .flexToSwipes:
                return conversionMode.value
            case let .swipesToFlex:
                return "\(conversionMode.amountForConversion())"
            }
        }
        var swipeText: String {
            switch conversionMode {
            case let .flexToSwipes:
                return "\(conversionMode.amountForConversion())"
            case let .swipesToFlex:
                return conversionMode.value
            }
        }
        var proposedConversion: ConversionEvent {
            switch conversionMode {
            case let .flexToSwipes(amount):
                 return ConversionEvent(value: amount , description: "Converted \(amount) Flex Points", monetaryType: .flexPoints)
            case let .swipesToFlex(amount):
                 return ConversionEvent(value: amount, description: "Converted \(amount) Swipes", monetaryType: .swipes)
            }
        }
        static let empty: ConversionViewState = ConversionViewState(conversionMode: .swipesToFlex(amount: 0), pastConversions: [], conversionRequestState: .notDisplayed, conversionResultState: .notSet)
    }
    enum ConversionIntent: Intent, ActionIntent, ServiceIntent {
        case initial
        case didUpdateAmount(String)
        case didSwitchConversionMode
        case didInitiateConversion
        case didVerifyConversionRequest
        case didDeclineConversion
        case didAcknowledgeAlert
    }
    enum ConversionResult: Result {
        case notSet
        case initial
        case updateConversionAmount(String)
        case updateConversionEvents([ConversionEvent])
        case switchConversionMode
        case verifyConversion
        case beginConversion
        case dismissConversionRequest
        case conversionSuceeded
        case conversionFailed
        case acknowledgeAlert
    }
    enum ConversionMode {
        case flexToSwipes(amount: Int)
        case swipesToFlex(amount: Int)
        var alternate: ConversionMode {
            switch self {
            case let .flexToSwipes(amount):
                return .swipesToFlex(amount: amountForConversion())
            case let .swipesToFlex(amount):
                return .flexToSwipes(amount: amountForConversion())
            }
        }
        func amountForConversion() -> Int {
            switch self {
            case let .flexToSwipes(amount):
                return amount/8
            case let .swipesToFlex(amount):
                return amount*8
            }
        }
        var amount: Int {
            switch self {
            case let .flexToSwipes(amount):
                return amount
                
            case let .swipesToFlex(amount):
                return amount
            }
        }
        var value: String {
            switch self {
            case let .flexToSwipes(amount):
                return "\(amount)"

            case let .swipesToFlex(amount):
                return "\(amount)"
            }
        }
    }
}
