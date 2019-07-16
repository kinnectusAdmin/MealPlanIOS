//
//  ConversionViewType.swift
//  MealPlan
//
//  Created by blakerogers on 6/10/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import UIKit
import CleanModelViewIntent
import Utilities

protocol ConversionViewType: Presentation, Controller, Alerting, Loading {
    var flexBalanceLabel: UILabel { get set }
    var swipesBalanceLabel: UILabel { get set }
    var swapConversionButton: UXButton { get set }
    var initiateConversionButton: UXButton { get set }
    var conversionEventCollection: UXCollectionView<ConversionEventSectionModel> { get set}
    var numberPadView: NumberPadViewType { get set}
}
