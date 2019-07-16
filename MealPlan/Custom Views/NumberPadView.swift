//
//  NumberPadView.swift
//  MealPlan
//
//  Created by blakerogers on 6/8/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import UIKit
import Utilities
import CleanModelViewIntent
import MealPlanDomain

protocol NumberPadViewType {
    var padOutput: Box<PadOutput> { get set}
    func render() -> UIView
}

class NumberPadView: UIView, NumberPadViewType {
    
    private let numberOne: PadButton = PadButton.button(output: .one)
    
    private let numberTwo: PadButton = PadButton.button(output: .two)
    
    private let numberThree: PadButton = PadButton.button(output: .three)
    
    private let numberFour: PadButton = PadButton.button(output: .four)
    
    private let numberFive: PadButton = PadButton.button(output: .five)
    
    private let numberSix: PadButton = PadButton.button(output: .six)
    
    private let numberSeven: PadButton = PadButton.button(output: .seven)
    
    private let numberEight: PadButton = PadButton.button(output: .eight)
    
    private let numberNine: PadButton = PadButton.button(output: .nine)
    
    private let numberZero: PadButton = PadButton.button(output: .zero)
    
    private let backspace: PadButton = PadButton.button(output: .backspace)

    var padOutput: Box<PadOutput> = Box(.none)
    
    func render() -> UIView {
        return self
    }
}

extension NumberPadView {
    override func layoutSubviews() {
        super.layoutSubviews()
        setViews()
        bindUIActions()
    }
    private func setViews() {
        self.backgroundColor = ViewProperties.background
        self.add(views: numberOne, numberTwo, numberThree, numberFour, numberFive, numberSix, numberSeven, numberEight, numberNine, numberZero, backspace)
        //align 1, 4, and 5 to left
        numberOne.constrainInView(view: self, top: 0, left: 0)
        numberFour.constrainCenterXTo(view: numberOne, constant: 0)
        numberFour.constrainTopToBottom(of: numberOne, constant: Layout.buttonTopOffset)
        numberSeven.constrainCenterXTo(view: numberOne, constant: 0)
        numberSeven.constrainTopToBottom(of: numberFour, constant: Layout.buttonTopOffset)
        //align 2,5,8, and 0 to center x
        numberTwo.constrainTopToTop(of: self, constant: 0)
        numberTwo.constrainCenterXTo(view: self, constant: 0)
        numberFive.constrainCenterXTo(view: numberTwo, constant: 0)
        numberEight.constrainCenterXTo(view: numberTwo, constant: 0)
        numberZero.constrainCenterXTo(view: numberTwo, constant: 0)
        //alignt 3,6, 9, and backspace to right
        numberThree.constrainInView(view: self, top: 0, right: 0)
        numberSix.constrainCenterXTo(view: numberThree, constant: 0)
        numberNine.constrainCenterXTo(view: numberThree, constant: 0)
        backspace.constrainCenterXTo(view: numberThree, constant: 0)
        //align 2 and 3 to number one
        numberTwo.constrainCenterYTo(view: numberOne, constant: 0)
        numberThree.constrainCenterYTo(view: numberOne, constant: 0)
        //align 5 and 6 to number four
        numberFive.constrainCenterYTo(view: numberFour, constant: 0)
        numberSix.constrainCenterYTo(view: numberFour, constant: 0)
        //align 8 and 9 to number seven
        numberEight.constrainCenterYTo(view: numberSeven, constant: 0)
        numberNine.constrainCenterYTo(view: numberSeven, constant: 0)
        //align 0 and backspace to decimal
        numberZero.constrainTopToBottom(of: numberEight, constant: Layout.buttonTopOffset)
        backspace.constrainCenterYTo(view: numberZero, constant: 0)
        let buttons: [PadButton] = subviews.filter { $0 is PadButton }.compactMap { $0} as? [PadButton] ?? []
        buttons.forEach { (button) in
            button.constrainWidth_Height(width: Layout.buttonWidth, height: Layout.buttonHeight)
        }
    }
    private func bindUIActions() {
        let buttons: [PadButton] = subviews.filter { $0 is PadButton }.compactMap { $0} as? [PadButton] ?? []
        buttons.forEach { (button) in
            button.setAction({ [weak self] in
                self?.padOutput.accept( button.padOutput)
            })
        }
    }
}
extension NumberPadView {
    static func view() -> NumberPadView {
        let view = NumberPadView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
}
extension NumberPadView {
    struct ViewProperties {
        static let background: UIColor = .clear
    }
    struct Layout {
        static let buttonWidth: CGFloat = 25
        static let buttonHeight: CGFloat = 25
        static let buttonTopOffset: CGFloat = 10
        static let numberPadHeight: CGFloat = (4 * buttonWidth) + (3 * buttonTopOffset)
    }
}
