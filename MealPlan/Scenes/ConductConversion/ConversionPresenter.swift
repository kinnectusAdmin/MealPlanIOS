//
//  ConversionPresenter.swift
//  MealPlan
//
//  Created by blakerogers on 3/4/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
import CleanModelViewIntent
struct ConversionPresenter: PresenterLink {
    typealias Link = ConversionViewModelLink
    typealias View = ConversionViewType
    static var action: (Link.ViewStateType?, Link.ViewStateType?, View) -> Void = { state, _, view in
        let state = state ?? Link.ViewStateType.empty
        
        view.flexBalanceLabel.text = state.flexText
        
        view.swipesBalanceLabel.text = state.swipeText
        
        view.conversionEventCollection.model.accept(ConversionEventSectionModel(viewState: state))
        
        switch state.conversionMode {
        case .swipesToFlex:
            view.initiateConversionButton.updateAttributedTitle(title: "Convert Swipes to Flex Points")
        case .flexToSwipes:
            view.initiateConversionButton.updateAttributedTitle(title: "Convert Flex Points to Swipes")
        }
        
        switch state.conversionRequestState {
        case .display:
            view.alertScreen.alert(message: "Confirm Conversion", acceptText: "Confirm", declineText: "Cancel")
        case .notDisplayed:
            view.alertScreen.dismissAlert()
        }
        switch state.conversionResultState {
        case .loading:
            view.loading()
        case let .error(error):
            view.alertScreen.alert(message: error, acceptText: "Okay", declineText: nil)
            view.dismissLoading()
        case .success:
            view.alertScreen.alert(message: "Conversion Completed", acceptText: "Okay", declineText: nil)
            view.dismissLoading()
        default: break
        }
    }
    static var interaction: (ConversionViewType, Box<Link.IntentType?>) -> Void = {
        view, interactor in
        view.initiateConversionButton.setAction({
            interactor.accept(Link.ConversionIntent.didInitiateConversion)
        })
        view.swapConversionButton.setAction({
            interactor.accept(Link.ConversionIntent.didSwitchConversionMode)
        })
        view.numberPadView.padOutput.bindListener {  output,_ in
            interactor.accept(Link.ConversionIntent.didUpdateAmount(output.rawValue))
        }
        view.alertScreen.acceptButton.setAction {
            interactor.accept(Link.ConversionIntent.didVerifyConversionRequest)
        }
        view.alertScreen.acknowledgeAlertButton.setAction {
            interactor.accept(Link.ConversionIntent.didAcknowledgeAlert)
        }
        view.alertScreen.declineButton.setAction {
            interactor.accept(Link.ConversionIntent.didDeclineConversion)
        }
    }
}

