//
//  MainFeedTrendItemViewModel.swift
//  MealPlan
//
//  Created by blakerogers on 3/24/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
import CleanModelViewIntent
import MealPlanDomain
import Utilities
struct MainFeedTrendItemViewModel: ViewModelLink {
    
    typealias Link = MainFeedTrendItemViewModelLink
    typealias ViewState = Link.ViewStateType
    typealias ResultType = Link.ItemResult
    
    static var serviceHandler: ((ServiceIntent?, MainFeedTrendItemViewModelLink.ViewStateType) -> Void)?

    static var delegateHandler: ((DelegateIntent?, MainFeedTrendItemViewModelLink.ViewStateType) -> Void)?

    static var initialIntent: MainFeedTrendItemViewModelLink.ItemIntent?

    static var intentHandler: (MainFeedTrendItemViewModelLink.ItemIntent) -> MainFeedTrendItemViewModelLink.ItemResult =
    {
        intent in
        switch intent {
        case let .initial(swipe, flex, trend):
            return ResultType.inital(swipe: swipe, flex: flex, trend: trend)
        }
    }
    static var partialResultHandler: (Result) -> MainFeedTrendItemViewModelLink.ItemResult? = { _ in return nil}
    
    static func reduce(viewState: MainFeedTrendItemViewModelLink.ItemViewState?, result: MainFeedTrendItemViewModelLink.ItemResult?) -> MainFeedTrendItemViewModelLink.ItemViewState? {
        switch result {
        case let .inital(swipe, flex, trend)?:
            return ViewState(swipeBalance: swipe, flexBalance: flex, trendType: trend)
        default: return viewState
        }
    }
}
struct MainFeedTrendItemViewModelLink: ViewStateIntentLink {
    
    typealias ViewStateType = ItemViewState
    typealias IntentType = ItemIntent
    typealias ResultType = ItemResult
    
    enum ItemIntent: Intent, ActionIntent {
        case initial(swipe: SwipesBalance, flex: FlexBalance, trend: Objects.BalanceTrendType)
    }
    enum ItemResult: Result {
        case inital(swipe: SwipesBalance, flex: FlexBalance, trend: Objects.BalanceTrendType)
    }
    struct ItemViewState: ViewState {
        let trendType: Objects.BalanceTrendType
        let flexValue: String
        let swipesValue: String
        init(swipeBalance: SwipesBalance, flexBalance: FlexBalance, trendType: Objects.BalanceTrendType) {
            self.trendType = trendType
            switch trendType {
            case .conversion:
                self.flexValue = flexBalance.converted.description
                self.swipesValue = swipeBalance.converted.description
            case .sent:
                self.flexValue = ""
                self.swipesValue = swipeBalance.sent.description
            case .spent:
                self.flexValue = flexBalance.spent.description
                self.swipesValue = swipeBalance.spent.description
            case .received:
                self.flexValue = flexBalance.received.description
                self.swipesValue = swipeBalance.received.description
            }
        }
    }
}
