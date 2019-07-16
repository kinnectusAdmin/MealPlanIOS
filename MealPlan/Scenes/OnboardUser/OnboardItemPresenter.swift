//
//  OnboardItemPresenter.swift
//  MealPlan
//
//  Created by blakerogers on 3/7/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
import CleanModelViewIntent
struct OnboardItemPresenter: ItemPresenterLink {
    
    typealias Link = OnboardItemViewModelLink
    typealias View = OnboardItemView
    
    static var action: (OnboardItemViewModelLink.ItemViewState?, OnboardItemViewModelLink.ItemViewState?, OnboardItemView) -> Void =
    {
        viewState, previousViewState, view in
        guard let viewState = viewState else {return}
        view.featureLabel.text = viewState.page.content
    }
    
    static var interaction: (OnboardItemView, Box<OnboardItemViewModelLink.ItemIntent?>) -> Void =
    {
        item, interactor in
        item.addTapGestureRecognizer(action: {
            interactor.accept(OnboardItemViewModelLink.IntentType.didSelectPage)
        })
    }
}

