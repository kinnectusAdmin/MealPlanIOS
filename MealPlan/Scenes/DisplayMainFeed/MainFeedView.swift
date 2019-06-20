//
//  MainFeedView.swift
//  MealPlan
//
//  Created by blakerogers on 3/3/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import UIKit
import Utilities
import CleanModelViewIntent

class MainFeedView: UIViewController, MainFeedViewType {
    var mainFeedCollectionView = UXCollectionView<MainFeedSectionModel>(model: nil, frame: CGRect(x: 0, y: 0, width: 300, height: 300))
}
extension MainFeedView {
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
    }
    func setViews() {
        title = "MainFeedView"
        view.backgroundColor = ViewProperties.backgroundColor
        view.add(views: mainFeedCollectionView)
        mainFeedCollectionView.constrainInView(view: self.view, top: 0, left: 0, right: 0, bottom: 0)
    }
}
