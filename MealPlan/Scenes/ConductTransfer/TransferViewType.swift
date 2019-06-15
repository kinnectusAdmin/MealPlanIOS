//
//  TransferViewType.swift
//  MealPlan
//
//  Created by blakerogers on 6/10/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import UIKit
import CleanModelViewIntent
import Utilities
import MealPlanDomain

protocol TransferViewType: Presentation, Controller {
    var localUserAvatar: UXImage { get set }
    var transacteeAvatar: UXImage { get set }
    var localUserNameLabel: UILabel { get set }
    var transacteeNameLabel: UILabel { get set }
    var transferControlButton: UXButton { get set }
    var balanceLabel: UILabel { get set }
    var sendButton: UXButton { get set }
    var searchButton: UXButton { get set }
    var numberPadView: NumberPadViewType { get set}
    var transferEventCollection: UXCollectionView<TransferEventSectionModel> { get set}
    var searchView: UserSearchViewType { get set }
    func updateTransferDirection(transfer: TransferMode)
    func presentHideSearchView(present: Bool)
}
