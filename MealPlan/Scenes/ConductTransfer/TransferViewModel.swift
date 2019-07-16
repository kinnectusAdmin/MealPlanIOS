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
import MealPlanNetwork

struct TransferViewModel: ViewModelLink {
    
    typealias Link = TransferViewModelLink
    typealias ResultType = Link.TransferResult
    typealias ServiceType = MealPlanNetwork.EventUseCase
    typealias DelegateType = NilDelegateType
    
    static var serviceHandler: ((TransferViewModelLink.TransferIntent, TransferViewModelLink.TransferViewState, ServiceType?) -> Void)? =
    {
        intent, viewState, service in
        switch intent {
        case .initial:
            service?.fetchTransferEvents(userID: MealPlanUser.local.uid)
        case .didVerifyTransferRequest:
            service?.recordTransfer(transfer: viewState.transfer)
        default: break
        }
    }
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
        case .didInitiateTransfer:
            return ResultType.verifyTransfer
        case .didDeclineTransfer:
            return ResultType.dismissTransferRequest
        case .didVerifyTransferRequest:
            return ResultType.beginTransfer
        case .didAcknowledgeAlert:
            return ResultType.acknowledgeAlert
        default: return ResultType.notSet
        }
    }
    static var partialResultHandler: ((Result) -> TransferViewModelLink.TransferResult?)? =
    {
        result in
        switch result as? MealPlanNetwork.EventNetwork.EventNetworkResult {
        case let .didFetchTransferEvents(events)?:
            return ResultType.updateTransferEvents(events)
        case .fetchTransferEventsFailure?:
            return ResultType.transferFailed
        case .didRecordTransfer?:
            return ResultType.transferSucceeded
        default: return nil
        }
    }
    
    static func reduce(viewState: TransferViewModelLink.TransferViewState?, result: TransferViewModelLink.TransferResult?) -> TransferViewModelLink.TransferViewState? {
        let state = viewState ?? Link.TransferViewState.empty
        switch result {
        case .initial?:
            return Link.TransferViewState.empty
        case .swapTransferMode?:
            return Link.TransferViewState(transferIntention: state.transferIntention.alternate, transferType: state.transferType, pastTransfers: state.pastTransfers, userSearchText: state.userSearchText, userSearchResults: state.userSearchResults, searchViewState: state.searchViewState, transferValue: state.transferValue, selectedTransactee: state.selectedTransactee, transferRequestState: state.transferRequestState, transferResultState: .notSet)
        case let .updateTransferType(type)?:
            return Link.TransferViewState(transferIntention: state.transferIntention, transferType: type, pastTransfers: state.pastTransfers, userSearchText: state.userSearchText, userSearchResults: state.userSearchResults, searchViewState: state.searchViewState, transferValue: state.transferValue, selectedTransactee: state.selectedTransactee, transferRequestState: state.transferRequestState, transferResultState: state.transferResultState)
        case .showSearch?:
            return Link.TransferViewState(transferIntention: state.transferIntention, transferType: state.transferType, pastTransfers: state.pastTransfers, userSearchText: state.userSearchText, userSearchResults: state.userSearchResults, searchViewState: .display, transferValue: state.transferValue, selectedTransactee: state.selectedTransactee, transferRequestState: state.transferRequestState, transferResultState: state.transferResultState)
        case .dismissSearch?:
            return Link.TransferViewState(transferIntention: state.transferIntention, transferType: state.transferType, pastTransfers: state.pastTransfers, userSearchText: state.userSearchText, userSearchResults: state.userSearchResults, searchViewState: .notDisplayed, transferValue: state.transferValue, selectedTransactee: state.selectedTransactee, transferRequestState: state.transferRequestState, transferResultState: state.transferResultState)
        case let .updateTransferAmounts(value)?:
            let transferAmount = PadOutput.outputFor(currentInput: state.transferValue, input: PadOutput(rawValue: value) ?? .none)
            return Link.TransferViewState(transferIntention: state.transferIntention, transferType: state.transferType, pastTransfers: state.pastTransfers, userSearchText: state.userSearchText, userSearchResults: state.userSearchResults, searchViewState: state.searchViewState, transferValue: transferAmount, selectedTransactee: state.selectedTransactee, transferRequestState: state.transferRequestState, transferResultState: state.transferResultState)
        case let .requestUser(user)?:
            return Link.TransferViewState(transferIntention: state.transferIntention, transferType: state.transferType, pastTransfers: state.pastTransfers, userSearchText: state.userSearchText, userSearchResults: state.userSearchResults, searchViewState: state.searchViewState, transferValue: state.transferValue, selectedTransactee: user, transferRequestState: state.transferRequestState, transferResultState: state.transferResultState)
        case let .updateSearchField(searchText)?:
            return Link.TransferViewState(transferIntention: state.transferIntention, transferType: state.transferType, pastTransfers: state.pastTransfers, userSearchText: searchText, userSearchResults: state.userSearchResults, searchViewState: state.searchViewState, transferValue: state.transferValue, selectedTransactee: state.selectedTransactee, transferRequestState: state.transferRequestState, transferResultState: state.transferResultState)
        case let .updateTransferEvents(events)?:
            return Link.TransferViewState(transferIntention: state.transferIntention, transferType: state.transferType, pastTransfers: events, userSearchText: state.userSearchText, userSearchResults: state.userSearchResults, searchViewState: state.searchViewState, transferValue: state.transferValue, selectedTransactee: state.selectedTransactee, transferRequestState: state.transferRequestState, transferResultState: state.transferResultState)
        case .verifyTransfer?:
            if state.transfer.value > 0 && state.transfer.value < 10 {
                return Link.TransferViewState(transferIntention: state.transferIntention, transferType: state.transferType, pastTransfers: state.pastTransfers, userSearchText: state.userSearchText, userSearchResults: state.userSearchResults, searchViewState: state.searchViewState, transferValue: state.transferValue, selectedTransactee: state.selectedTransactee, transferRequestState: .display, transferResultState: state.transferResultState)
            } else {
                return Link.TransferViewState(transferIntention: state.transferIntention, transferType: state.transferType, pastTransfers: state.pastTransfers, userSearchText: state.userSearchText, userSearchResults: state.userSearchResults, searchViewState: state.searchViewState, transferValue: state.transferValue, selectedTransactee: state.selectedTransactee, transferRequestState: .notDisplayed, transferResultState: .error(message: "Invalid Transfer Amount: \n Must be between 1 and 10 swipes/flex Points"))
            }
        case .dismissTransferRequest?:
            return Link.TransferViewState(transferIntention: state.transferIntention, transferType: state.transferType, pastTransfers: state.pastTransfers, userSearchText: state.userSearchText, userSearchResults: state.userSearchResults, searchViewState: state.searchViewState, transferValue: state.transferValue, selectedTransactee: state.selectedTransactee, transferRequestState: .notDisplayed, transferResultState: state.transferResultState)
        case .beginTransfer?:
            return Link.TransferViewState(transferIntention: state.transferIntention, transferType: state.transferType, pastTransfers: state.pastTransfers, userSearchText: state.userSearchText, userSearchResults: state.userSearchResults, searchViewState: state.searchViewState, transferValue: state.transferValue, selectedTransactee: state.selectedTransactee, transferRequestState: .notDisplayed, transferResultState: .loading)
        case .transferSucceeded?:
            return Link.TransferViewState(transferIntention: state.transferIntention, transferType: state.transferType, pastTransfers: state.pastTransfers, userSearchText: "", userSearchResults: [], searchViewState: state.searchViewState, transferValue: "0", selectedTransactee: state.selectedTransactee, transferRequestState: .notDisplayed, transferResultState: .success)
        case .transferFailed?:
            return Link.TransferViewState(transferIntention: state.transferIntention, transferType: state.transferType, pastTransfers: state.pastTransfers, userSearchText: state.userSearchText, userSearchResults: state.userSearchResults, searchViewState: state.searchViewState, transferValue: state.transferValue, selectedTransactee: state.selectedTransactee, transferRequestState: state.transferRequestState, transferResultState: .error(message: "Error Completing Transfer:"))
        case .acknowledgeAlert?:
            return Link.TransferViewState(transferIntention: state.transferIntention, transferType: state.transferType, pastTransfers: state.pastTransfers, userSearchText: state.userSearchText, userSearchResults: state.userSearchResults, searchViewState: state.searchViewState, transferValue: state.transferValue, selectedTransactee: state.selectedTransactee, transferRequestState: .notDisplayed, transferResultState: .notSet)
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
        let transferRequestState: DisplayState
        let transferResultState: ResultState
        var transferAmount: Int {
            return Int(transferValue) ?? 0
        }
        var transferDescription: String {
            switch (transferType, transferIntention) {
            case (.flex, .requesting):
                return "Requested \(transferAmount) flex from \(selectedTransactee.firstName)"
            case (.flex, .sending):
                return "Transferred \(transferAmount) flex to \(selectedTransactee.firstName)"
            case (.swipes, .requesting):
                return "Requested \(transferAmount) swipes from \(selectedTransactee.firstName)"
            case (.swipes, .sending):
                return "Transferred \(transferAmount) swipes to \(selectedTransactee.firstName)"
            }
        }
        var sender: EventUser {
            switch transferIntention {
            case .sending: return MealPlanUser.local.asEventUser()
            case.requesting: return selectedTransactee.asEventUser()
            }
        }
        var receiver: EventUser {
            switch transferIntention {
            case .sending: return selectedTransactee.asEventUser()
            case.requesting: return MealPlanUser.local.asEventUser()
            }
        }
        var transfer: TransferEvent {
            return TransferEvent(value: transferAmount, description: transferDescription, sender: sender, receiver: receiver)
        }
        static var empty: TransferViewState {
            return TransferViewState(transferIntention: .sending, transferType: .swipes, pastTransfers: [], userSearchText: "", userSearchResults: [MealPlanUser.local, MealPlanUser.local, MealPlanUser.local], searchViewState: .notDisplayed, transferValue: "0", selectedTransactee: MealPlanUser.local, transferRequestState: .notDisplayed, transferResultState: .notSet)
        }
    }
    enum TransferIntent: Intent, ActionIntent, ServiceIntent {
        case initial
        case didInitiateTransfer
        case didVerifyTransferRequest
        case didDeclineTransfer
        case didSelectSwapTransferMode
        case didSelectTransferType(TransferType)
        case didSelectSearch
        case didDismissSearch
        case didUpdateTransferAmounts(value: String)
        case didSelectViewUser(MealPlanUser)
        case didSelectRequestUser(MealPlanUser)
        case didUpdateSearchField(String)
        case didAcknowledgeAlert
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
        case updateTransferEvents([TransferEvent])
        case verifyTransfer
        case beginTransfer
        case dismissTransferRequest
        case transferSucceeded
        case transferFailed
        case acknowledgeAlert
    }
}
