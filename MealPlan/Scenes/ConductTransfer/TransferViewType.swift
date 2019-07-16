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

protocol TransferViewType: Presentation, Controller, SlidingContainer, Alerting, Loading {
    var localUserAvatar: UXImage { get set }
    var transacteeAvatar: UXImage { get set }
    var localUserAvatarBorder: UIView { get set }
    var transacteeAvatarBorder: UIView { get set }
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
extension TransferViewType {
    func updateTransferDirection(transfer: TransferMode) {
        switch transfer {
        case .requesting:
            UIView.animate(withDuration: 0.25) {
                self.localUserAvatarBorder.backgroundColor = TransferView.ViewProperties.receivingBorderColors.outter
                self.localUserAvatarBorder.subviews.first?.backgroundColor = TransferView.ViewProperties.receivingBorderColors.inner
                self.transacteeAvatarBorder.backgroundColor = TransferView.ViewProperties.sendingBorderColors.outter
                self.transacteeAvatarBorder.subviews.first?.backgroundColor = TransferView.ViewProperties.sendingBorderColors.inner
            }
        case .sending:
            UIView.animate(withDuration: 0.25) {
                self.localUserAvatarBorder.backgroundColor = TransferView.ViewProperties.sendingBorderColors.outter
                self.localUserAvatarBorder.subviews.first?.backgroundColor = TransferView.ViewProperties.sendingBorderColors.inner
                self.transacteeAvatarBorder.backgroundColor = TransferView.ViewProperties.receivingBorderColors.outter
                self.transacteeAvatarBorder.subviews.first?.backgroundColor = TransferView.ViewProperties.receivingBorderColors.inner
            }
        }
    }
    func presentHideSearchView(present: Bool) {
        let alpha: CGFloat = present ? 0.0 : 1.0
        UIView.animate(withDuration: 0.25) {
            self.numberPadView.render().alpha = alpha
            self.localUserAvatarBorder.alpha = alpha
            self.transacteeAvatarBorder.alpha = alpha
            self.balanceLabel.alpha = alpha
            self.localUserNameLabel.alpha = alpha
            self.transacteeNameLabel.alpha = alpha
            self.transferControlButton.alpha = alpha
            self.sendButton.alpha = alpha
            self.searchButton.alpha = alpha
            self.searchView.render().alpha = present ? 1.0 : 0.0
        }
    }
}
