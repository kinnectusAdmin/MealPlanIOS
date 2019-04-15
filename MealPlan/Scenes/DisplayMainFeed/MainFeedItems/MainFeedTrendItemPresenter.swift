//
//  MainFeedTrendItemPresenter.swift
//  MealPlan
//
//  Created by blakerogers on 3/24/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
import MealPlanDomain
import CleanModelViewIntent
struct MainFeedTrendItemPresenter: ItemPresenterLink {
    typealias View = MainFeedTrendItem
    typealias Link = MainFeedTrendItemViewModelLink
    static var action: (MainFeedTrendItemViewModelLink.ItemViewState?, MainFeedTrendItemViewModelLink.ItemViewState?, MainFeedTrendItem) -> Void =
    { viewState, _, view in
        guard let state = viewState else { return }
        view.trendIcon.image = Icons.iconForTrend(trend: state.trendType)
        view.flexTrendLabel.text = state.flexValue
        view.swipesTrendLabel.text = state.swipesValue
    }
    
    static var interaction: (MainFeedTrendItem, Box<MainFeedTrendItemViewModelLink.ItemIntent?>) -> Void =
    { view, interactor in
        
    }
}
