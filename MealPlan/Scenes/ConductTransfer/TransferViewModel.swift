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
    typealias ServiceType = NilServiceType
    typealias DelegateType = NilDelegateType
    
    static var serviceHandler: ((TransferViewModelLink.TransferIntent, TransferViewModelLink.TransferViewState, NilServiceType?) -> Void)?
    static var delegateHandler: ((TransferViewModelLink.TransferIntent, TransferViewModelLink.TransferViewState, NilDelegateType?) -> Void)?
    static var initialIntent: TransferViewModelLink.TransferIntent? = .initial

    static var intentHandler: ((TransferViewModelLink.TransferIntent) -> TransferViewModelLink.TransferResult)? =
    {
        intent in
        switch intent {
        case .initial:
            return ResultType.initial
        case .didSelectSwapTransferMode:
            return ResultType.swapTransferMode
        case let .didSelectTransferType(transferType):
            return ResultType.updateTransferType(transferType)
        case .didSelectSearch:
            return ResultType.showSearch
        case .didDismissSearch:
            return ResultType.dismissSearch
        case let .didUpdateTransferAmounts(value):
            return ResultType.updateTransferAmounts(value: value)
        case let .didSelectRequestUser(user):
            return ResultType.requestUser(user)
        case let .didUpdateSearchField(text):
            return ResultType.updateSearchField(text)
        default: return ResultType.notSet
        }
    }
    static var partialResultHandler: ((Result) -> TransferViewModelLink.TransferResult?)? = { _ in return nil}
    
    static func reduce(viewState: TransferViewModelLink.TransferViewState?, result: TransferViewModelLink.TransferResult?) -> TransferViewModelLink.TransferViewState? {
        let state = viewState ?? Link.TransferViewState.empty
        switch result {
        case .initial?:
            return Link.TransferViewState.empty
        case .swapTransferMode?:
            return Link.TransferViewState(transferIntention: state.transferIntention.alternate, transferType: state.transferType, pastTransfers: state.pastTransfers, userSearchText: state.userSearchText, userSearchResults: state.userSearchResults, searchViewState: state.searchViewState, transferValue: state.transferValue, selectedTransactee: state.selectedTransactee)
        case let .updateTransferType(type)?:
            return Link.TransferViewState(transferIntention: state.transferIntention, transferType: type, pastTransfers: state.pastTransfers, userSearchText: state.userSearchText, userSearchResults: state.userSearchResults, searchViewState: state.searchViewState, transferValue: state.transferValue, selectedTransactee: state.selectedTransactee)
        case .showSearch?:
            return Link.TransferViewState(transferIntention: state.transferIntention, transferType: state.transferType, pastTransfers: state.pastTransfers, userSearchText: state.userSearchText, userSearchResults: state.userSearchResults, searchViewState: .display, transferValue: state.transferValue, selectedTransactee: state.selectedTransactee)
        case .dismissSearch?:
            return Link.TransferViewState(transferIntention: state.transferIntention, transferType: state.transferType, pastTransfers: state.pastTransfers, userSearchText: state.userSearchText, userSearchResults: state.userSearchResults, searchViewState: .notDisplayed, transferValue: state.transferValue, selectedTransactee: state.selectedTransactee)
        case let .updateTransferAmounts(value)?:
            var transferAmount = PadOutput.outputFor(currentInput: state.transferValue, input: PadOutput(rawValue: value) ?? .none)
            return Link.TransferViewState(transferIntention: state.transferIntention, transferType: state.transferType, pastTransfers: state.pastTransfers, userSearchText: state.userSearchText, userSearchResults: state.userSearchResults, searchViewState: state.searchViewState, transferValue: transferAmount, selectedTransactee: state.selectedTransactee)
        case let .requestUser(user)?:
            return Link.TransferViewState(transferIntention: state.transferIntention, transferType: state.transferType, pastTransfers: state.pastTransfers, userSearchText: state.userSearchText, userSearchResults: state.userSearchResults, searchViewState: state.searchViewState, transferValue: state.transferValue, selectedTransactee: user)
        case let .updateSearchField(searchText)?:
            return Link.TransferViewState(transferIntention: state.transferIntention, transferType: state.transferType, pastTransfers: state.pastTransfers, userSearchText: searchText, userSearchResults: state.userSearchResults, searchViewState: state.searchViewState, transferValue: state.transferValue, selectedTransactee: state.selectedTransactee)
        default: return viewState
        }
    }
}
struct TransferViewModelLink: ViewStateIntentLink {
    
    typealias ViewStateType  = TransferViewState
    typealias IntentType = TransferIntent
    typealias ResultType = TransferResult
    
    
    struct TransferViewState: ViewState {
        let transferIntention: TransferMode
        let transferType: TransferType
        let pastTransfers: [TransferEvent]
        let userSearchText: String
        let userSearchResults: [MealPlanUser]
        let searchViewState: DisplayState
        let transferValue: String
        let selectedTransactee: MealPlanUser
        var transferAmount: Int {
            return Int(transferValue) ?? 0
        }
        static var empty: TransferViewState {
            return TransferViewState(transferIntention: .sending, transferType: .swipes, pastTransfers: [], userSearchText: "", userSearchResults: [MealPlanUser.local, MealPlanUser.local, MealPlanUser.local], searchViewState: .notDisplayed, transferValue: "0", selectedTransactee: MealPlanUser.local)
        }
    }
    enum TransferIntent: Intent, ActionIntent, ServiceIntent {
        case initial
        case didInitiateTransfer
        case didSelectSwapTransferMode
        case didSelectTransferType(TransferType)
        case didSelectSearch
        case didDismissSearch
        case didUpdateTransferAmounts(value: String)
        case didSelectViewUser(MealPlanUser)
        case didSelectRequestUser(MealPlanUser)
        case didUpdateSearchField(String)
    }
    enum TransferResult: Result {
        case notSet
        case initial
        case swapTransferMode
        case updateTransferType(TransferType)
        case showSearch
        case dismissSearch
        case updateTransferAmounts(value: String)
        case requestUser(MealPlanUser)
        case updateSearchField(String)
    }
}
