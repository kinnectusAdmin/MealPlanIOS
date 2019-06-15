//
//  TransferIndicationView.swift
//  MealPlan
//
//  Created by blakerogers on 6/7/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import UIKit

class TransferIndicationView: UIView {
    
}
extension TransferIndicationView {
    static func view() -> TransferIndicationView {
        let view = TransferIndicationView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
}
extension TransferIndicationView {
    struct Layout {
        static let width: CGFloat = 100
    }
}
