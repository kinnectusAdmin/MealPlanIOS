//
//  MainFeedGraphItemPresenter.swift
//  MealPlan
//
//  Created by blakerogers on 6/6/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
import CleanModelViewIntent

struct MainFeedGraphItemPresenter: ItemPresenterLink {
    typealias View = MainFeedGraphItemType
    typealias Link = MainFeedGraphItemViewModelLink
    
    static var action: (MainFeedGraphItemViewModelLink.ItemViewState?, MainFeedGraphItemViewModelLink.ItemViewState?, MainFeedGraphItemType) -> Void =
    {
        viewState, _, view in
    
        view.averageLabel.text = "Avg: 3 swipes/day" //viewState?.average
        view.detailsLabel.text = viewState?.detailsTitle
        view.titleLabel.text = viewState?.title
        view.setBalances(balances: viewState?.points ?? [])
    }
    
    static var interaction: (MainFeedGraphItemType, Box<MainFeedGraphItemViewModelLink.ItemIntent?>) -> Void =
    {
        intent, interactor in
    }
    
    
}
