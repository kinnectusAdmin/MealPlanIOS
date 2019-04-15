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
struct DiningHistoryItemPresenter: ItemPresenterLink {
    typealias View = MainFeedHistoryItem
    typealias Link = DiningEventHistoryItemViewModelLink
    
    static var action: (DiningEventHistoryItemViewModelLink.ViewStateType?, DiningEventHistoryItemViewModelLink.ViewStateType?, MainFeedHistoryItem) -> Void = { viewState, _, view in
        view.dateLabel.text = viewState?.eventDate
        view.descriptionLabel.text = viewState?.eventDescription
        view.image.loadImageWithURL(url: viewState?.userImage ?? "")
    }
    static var interaction: (MainFeedHistoryItem, Box<DiningEventHistoryItemViewModelLink.IntentType?>) -> Void = { item, interactor in
        
    }
}
struct TransferHistoryItemPresenter: ItemPresenterLink {
    typealias View = MainFeedHistoryItem
    typealias Link = TransferEventHistoryItemViewModelLink
    static var action: (TransferEventHistoryItemViewModelLink.ItemViewState?, TransferEventHistoryItemViewModelLink.ItemViewState?, MainFeedHistoryItem) -> Void
        = { viewState, _, view in
            view.dateLabel.text = viewState?.eventDate
            view.descriptionLabel.text = viewState?.eventDescription
            view.image.loadImageWithURL(url: viewState?.userImage ?? "")
    }
    static var interaction: (MainFeedHistoryItem, Box<Link.IntentType?>) -> Void = { item, interactor in
    }
}
struct ConversionHistoryItemPresenter: ItemPresenterLink {
    
    typealias Link = ConversionEventHistoryItemViewModelLink
    typealias View = MainFeedHistoryItem
    static var action: (Link.ViewStateType?, Link.ViewStateType?, MainFeedHistoryItem) -> Void = { viewState, _, view in
        view.dateLabel.text = viewState?.eventDate
        view.descriptionLabel.text = viewState?.eventDescription
    }
    static var interaction: (MainFeedHistoryItem, Box<Link.IntentType?>) -> Void = { item, interactor in
        
    }
}
