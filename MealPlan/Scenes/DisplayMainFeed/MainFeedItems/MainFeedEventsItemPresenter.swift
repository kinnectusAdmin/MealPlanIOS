//
//  MainFeedHistoryItemPresenter.swift
//  MealPlan
//
//  Created by blakerogers on 3/23/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
import Utilities
import CleanModelViewIntent

struct MainFeedEventsItemPresenter: ItemPresenterLink {
    typealias View = MainFeedEventsItemType
    typealias Link = MainFeedEventsItemViewModelLink
    
    static var action: (MainFeedEventsItemViewModelLink.ViewStateType?, MainFeedEventsItemViewModelLink.ViewStateType?, MainFeedEventsItemType) -> Void =
    {
        viewState, _, view in
        view.eventsCollection.model.accept(MainFeedEventsSectionModel(viewState: viewState))
      
    }
    static var interaction: (MainFeedEventsItemType, Box<MainFeedEventsItemViewModelLink.IntentType?>) -> Void =
    {
        item, interactor in
        
    }
}
struct MainFeedEventItemPresenter: ItemPresenterLink {
    typealias View = MainFeedEventItemType
    typealias Link = MainFeedEventItemViewModelLink
    
    static var action: (MainFeedEventItemViewModelLink.ViewStateType?, MainFeedEventItemViewModelLink.ViewStateType?, MainFeedEventItemType) -> Void =
    {
        viewState, _, view in
        view.dateLabel.text = viewState?.date
        view.descriptionLabel.text = viewState?.description
        view.avatar.loadImageWithURL(url:  viewState?.userImage ?? "", defaultImage: AppImages.person.image())
    }
    static var interaction: (MainFeedEventItemType, Box<MainFeedEventItemViewModelLink.IntentType?>) -> Void =
    {
        item, interactor in
        
    }
}
