//
//  MainFeedGraphItemViewModel.swift
//  MealPlan
//
//  Created by blakerogers on 3/25/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
import CleanModelViewIntent
import MealPlanDomain
struct MainFeedGraphItemViewModel: ViewModelLink {
    
    typealias Link = MainFeedGraphItemViewModelLink
    
    static var intentHandler: (MainFeedGraphItemViewModelLink.ItemIntent) -> MainFeedGraphItemViewModelLink.ItemResult =
    {
        intent in
        switch intent {
        case let .initial(balances):
            return MainFeedGraphItemViewModelLink.ResultType.initial(balances: balances)
        }
    }
    
    static var partialResultHandler: (Result) -> MainFeedGraphItemViewModelLink.ItemResult?  = {
        _ in
        return nil
    }
    
    static var serviceHandler: ((ServiceIntent?, MainFeedGraphItemViewModelLink.ViewStateType) -> Void)? = nil
    
    static var delegateHandler: ((DelegateIntent?, MainFeedGraphItemViewModelLink.ViewStateType) -> Void)? = nil
    
    static var initialIntent: MainFeedGraphItemViewModelLink.ItemIntent?
    
    static func reduce(viewState: MainFeedGraphItemViewModelLink.ItemViewState?, result: MainFeedGraphItemViewModelLink.ItemResult?) -> MainFeedGraphItemViewModelLink.ItemViewState? {
        switch result {
        case let .initial(balances)?:
            return MainFeedGraphItemViewModelLink.ViewStateType.init(balances: balances, trendType: .spent)
        default: return viewState
        }
    }
}
struct MainFeedGraphItemViewModelLink: ViewStateIntentLink {
    
    typealias ViewStateType = ItemViewState
    typealias IntentType = ItemIntent
    typealias ResultType = ItemResult
    
    
    enum ItemIntent: Intent, ActionIntent {
        case initial(balances: [Balance])
    }
    enum ItemResult: Result {
        case initial(balances: [Balance])
    }
    struct ItemViewState: ViewState {
        let points: [Double]
        let average: String
        let title: String
        let detailsTitle: String
        init(balances: [Balance], trendType: Objects.BalanceTrendType) {
            let totalSpent = balances.map {$0.spent}.reduce(0, {$0 + $1})
            let averageSpent = totalSpent/Double(balances.count)
            average = averageSpent.description
            points = balances.map { $0.remaining}
            
            switch trendType {
            case .conversion:
                self.title = "Conversions"
                self.detailsTitle = "Conversion Details"
            case .spent:
                self.title = "Meal Plan Spending"
                self.detailsTitle = "Spending Details"
            case .received:
                self.title = "Swipes Received"
                self.detailsTitle = "Transfer Details"
            case .sent:
                self.title = "Swipes Sent"
                self.detailsTitle = "Transfer Details"
            }
        }
    }
}
