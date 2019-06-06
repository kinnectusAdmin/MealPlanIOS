//
//  OnboardViewType.swift
//  MealPlan
//
//  Created by blakerogers on 5/19/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
import CleanModelViewIntent
import Utilities

protocol OnboardViewType: Presentation, Controller {
    var loginButton: UXButton { get set}
    var signUpButton: UXButton { get set}
    var onboardCollection: UXCollectionView<OnboardSectionModel> { get set}
    var indicator: UIPageControl { get set}
}
