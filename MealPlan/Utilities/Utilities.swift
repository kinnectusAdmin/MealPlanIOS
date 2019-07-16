//
//  Utilities.swift
//  MealPlan
//
//  Created by blakerogers on 7/12/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import UIKit

protocol SlidingContainer: class {
    var containerTopConstraint: NSLayoutConstraint { get set}
    var containerPanGesture: UIPanGestureRecognizer! { get set}
    var eventContainer: UIView { get set}
    func setGesture()
    func hideList()
    func displayList()
}
public struct SlidingContainerLayout {
    static let containerHeight: CGFloat = UIScreen.main.bounds.height-50
    static let containerOriginTopOffset: CGFloat = 0
    static let containerRestingTopOffset: CGFloat = -100
    static let containerRadius: CGFloat = 20
}
extension SlidingContainer where Self: UIViewController {
    func displayList() {
        UIView.animate(withDuration: 0.5, delay: 0.0, options: [], animations: {
            self.containerTopConstraint.constant = SlidingContainerLayout.containerRestingTopOffset
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    func hideList() {
        UIView.animate(withDuration: 0.5, delay: 0.0, options: [], animations: {
            self.containerTopConstraint.constant = SlidingContainerLayout.containerOriginTopOffset
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    func setGesture() {
        eventContainer.addPanGestureRecognizer { [weak self] gesture in
            guard let this = self else { return }
            let translation = gesture.translation(in: this.eventContainer).y
            switch gesture.state {
            case .changed:
                if translation <= -SlidingContainerLayout.containerHeight*0.5 {
                    UIView.animate(withDuration: 0.25) {
                        self?.containerTopConstraint.constant = -SlidingContainerLayout.containerHeight
                        self?.view.layoutIfNeeded()
                    }
                } else {
                    UIView.animate(withDuration: 0.25) {
                        self?.containerTopConstraint.constant = SlidingContainerLayout.containerRestingTopOffset + min(0, max(translation, -SlidingContainerLayout.containerHeight))
                        self?.view.layoutIfNeeded()
                    }
                }
                
            case .ended:
                if  this.containerTopConstraint.constant > -SlidingContainerLayout.containerHeight {
                    UIView.animate(withDuration: 0.25) {
                        self?.containerTopConstraint.constant = SlidingContainerLayout.containerRestingTopOffset
                        self?.view.layoutIfNeeded()
                    }
                }
            default: break
            }
        }
    }
}
