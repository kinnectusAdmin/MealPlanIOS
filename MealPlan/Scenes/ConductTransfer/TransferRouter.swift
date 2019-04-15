//
//  TransferRouter.swift
//  MealPlan
//
//  Created by blakerogers on 3/4/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
import CleanModelViewIntent
import MealPlanDomain
struct TransferRouter: RouterLink {
    typealias Link = TransferViewModelLink

    static var route: (TransferViewModelLink.TransferViewState?, TransferViewModelLink.TransferIntent, Router<TransferRouter>) -> Void =
    {
        viewState, intent, router in
        switch intent {
        case let .didSelectViewUser(user): break
            //TODO: Handle view user
        default: break
        }
    }
    static var onDismiss: () -> Void =
    {
        
    }
    
    static var onDismissWithInfo: (RouterInfo) -> Void =
    {
        info in
    }
}
