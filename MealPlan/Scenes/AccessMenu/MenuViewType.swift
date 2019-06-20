//
//  MenuViewType.swift
//  MealPlan
//
//  Created by blakerogers on 6/14/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
import UIKit
import CleanModelViewIntent
import Utilities

protocol MenuViewType: Presentation, Controller {
    var profileImage: UXImage { get set }
    var nameLabel: UILabel { get set }
    var schoolLabel: UILabel { get set }
    var mealPlanLabel: UILabel { get set }
    var emailLabel: UILabel { get set }
    var legalButton: UXButton { get set }
    var logoutButton: UXButton { get set }
}
