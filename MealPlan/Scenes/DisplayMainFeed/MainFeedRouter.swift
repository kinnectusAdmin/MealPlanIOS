//
//  MainFeedRouter.swift
//  MealPlan
//
//  Created by blakerogers on 3/3/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
import CleanModelViewIntent
struct MainFeedRouter: RouterLink  {
    typealias Link = MainFeedViewModelLink
    static var route: (MainFeedViewModelLink.MainFeedViewState?, MainFeedViewModelLink.MainFeedIntent, Router<MainFeedRouter>) -> Void =
    {
        viewState, intent, router in
        switch intent {
        case .didSelectTransactionDetails:
            //TODO: Handle transition to transaction details
            break
        case .didSelectSpendingDetails:
            //TODO: handle transition to spending details
            break
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
