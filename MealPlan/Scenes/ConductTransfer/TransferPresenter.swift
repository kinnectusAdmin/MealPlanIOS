//
//  TransferPresenter.swift
//  MealPlan
//
//  Created by blakerogers on 3/4/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
import CleanModelViewIntent
import MealPlanDomain

struct TransferPresenter: PresenterLink {
    typealias Link = TransferViewModelLink
    typealias View = TransferViewType
    static var action: (Link.ViewStateType?, Link.ViewStateType?, View) -> Void =
    {
        state, _, view in
        let state = state as? Link.TransferViewState ?? Link.TransferViewState.empty
        view.balanceLabel.text = state.transferValue
            view.localUserAvatar.loadImageWithURL(url: MealPlanUser.local.imageURL, defaultImage: AppImages.person.image())
            view.transacteeAvatar.loadImageWithURL(url: "", defaultImage: AppImages.person.image())
        view.localUserNameLabel.text = MealPlanUser.local.firstName
        view.transacteeNameLabel.text = "OtherUser"
        switch state.searchViewState {
        case .display:
            view.presentHideSearchView(present: true)
        case .notDisplayed:
            view.presentHideSearchView(present: false)
        }
        view.updateTransferDirection(transfer: state.transferIntention)
        switch state.transferIntention {
        case .requesting:
            view.sendButton.updateAttributedTitle(title: "Request")
        case .sending:
            view.sendButton.updateAttributedTitle(title: "Send")
        }
        view.searchView.searchCollection.model.accept(UserSearchViewSectionModel(viewState: state))
    }
    static var interaction: (TransferViewType, Box<Link.IntentType?>) -> Void =
    {
        view, interactor in
        view.sendButton.setAction({
            interactor.accept(Link.TransferIntent.didInitiateTransfer)
        })
        view.transferControlButton.setAction({
            interactor.accept(Link.TransferIntent.didSelectSwapTransferMode)
        })
        view.searchButton.setAction({
            interactor.accept(Link.TransferIntent.didSelectSearch)
        })
        view.searchView.dismissButton.setAction({
            interactor.accept(Link.TransferIntent.didDismissSearch)
        })
        view.searchView.searchBar.finalTextValue.bindListener { text,_ in
            interactor.accept(Link.TransferIntent.didUpdateSearchField(text))
        }
        view.numberPadView.padOutput.bindListener {  output,_ in
            interactor.accept(Link.TransferIntent.didUpdateTransferAmounts(value: output.value))
        }
    }
}
