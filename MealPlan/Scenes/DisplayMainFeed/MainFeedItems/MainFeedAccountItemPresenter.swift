//
//  MainFeedAccountItemPresenter.swift
//  MealPlan
//
//  Created by blakerogers on 6/6/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
import CleanModelViewIntent

struct MainFeedAccountItemPresenter: ItemPresenterLink {
    typealias View = MainFeedAccountItemType
    
    typealias Link = MainFeedAccountItemViewModelLink
    
    static var action: (MainFeedAccountItemViewModelLink.ItemViewState?, MainFeedAccountItemViewModelLink.ItemViewState?, MainFeedAccountItemType) -> Void =
    {
      viewState, _, item in
        item.swipesRemainingLabel.text = viewState?.swipesRemaining
        item.swipesSpentLabel.text = viewState?.swipesSpent
        item.swipesReceivedLabel.text = viewState?.swipesReceived
        item.swipesConvertedLabel.text = viewState?.swipesConverted
        item.flexRemainingLabel.text = viewState?.flexRemaining
        item.flexSpentLabel.text = viewState?.flexSpent
        item.flexReceivedLabel.text = viewState?.flexReceived
        item.flexConvertedLabel.text = viewState?.flexConverted
    }
    static var interaction: (MainFeedAccountItemType, Box<MainFeedAccountItemViewModelLink.ItemIntent?>) -> Void =
    {
        item, interactor in
    }
}
