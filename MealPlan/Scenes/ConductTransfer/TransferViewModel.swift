//
//  TransferViewModel.swift
//  MealPlan
//
//  Created by blakerogers on 3/4/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
import CleanModelViewIntent
import MealPlanDomain
struct TransferViewModel: ViewModelLink {
    
    typealias Link = TransferViewModelLink
    typealias ResultType = Link.TransferResult
        
    static var serviceHandler: ((ServiceIntent?, TransferViewModelLink.ViewStateType) -> Void)?
    
    static var delegateHandler: ((DelegateIntent?, TransferViewModelLink.ViewStateType) -> Void)?
    
    static var initialIntent: TransferViewModelLink.TransferIntent?

    static var intentHandler: (TransferViewModelLink.TransferIntent) -> TransferViewModelLink.TransferResult =
    {
        intent in
        switch intent {
        case .didSelectSwapTransferMode:
            return ResultType.swapTransferMode
        case let .didSelectTransferType(transferType):
            return ResultType.transferType(transferType)
        case .didSelectSearch:
            return ResultType.showSearch
        case .didDismissSearch:
            return ResultType.dismissSearch
        case let .didUpdateTransferAmounts(localUser, externalUser):
            return ResultType.updateTransferAmounts(localUser: localUser, externalUser: externalUser)
        case let .didSelectRequestUser(user):
            return ResultType.requestUser(user)
        case let .didUpdateSearchField(text):
            return ResultType.updateSearchField(text)
        default: return ResultType.notSet
        }
    }
    static var partialResultHandler: (Result) -> TransferViewModelLink.TransferResult? = { _ in return nil}
    
    static func reduce(viewState: TransferViewModelLink.TransferViewState?, result: TransferViewModelLink.TransferResult?) -> TransferViewModelLink.TransferViewState? {
        return viewState
    }
}
struct TransferViewModelLink: ViewStateIntentLink {
    typealias ViewStateType  = TransferViewState
    typealias IntentType = TransferIntent
    typealias ResultType = TransferResult
    
    struct TransferViewState: ViewState {
        let proposedTransfer: TransferEvent
        let transferIntention: TransferMode
        let transferType: TransferType
        let pastTransfers: [TransferEvent]
        let userSearchText: String
    }
    enum TransferIntent: Intent, ActionIntent, ServiceIntent {
        case didInitiateTransfer
        case didSelectSwapTransferMode
        case didSelectTransferType(TransferType)
        case didSelectSearch
        case didDismissSearch
        case didUpdateTransferAmounts(localUser: Int, externalUser: Int)
        case didSelectViewUser(MealPlanUser)
        case didSelectRequestUser(MealPlanUser)
        case didUpdateSearchField(String)
    }
    enum TransferResult: Result {
        case notSet
        case swapTransferMode
        case transferType(TransferType)
        case showSearch
        case dismissSearch
        case updateTransferAmounts(localUser: Int, externalUser: Int)
        case requestUser(MealPlanUser)
        case updateSearchField(String)
    }
    enum TransferMode{
        case requesting
        case sending
    }
    enum TransferType {
        case swipes
        case flex
    }
}
