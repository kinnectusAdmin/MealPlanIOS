//
//  MainFeedSectionModel.swift
//  MealPlan
//
//  Created by blakerogers on 6/3/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
import Utilities
import MealPlanDomain
import CleanModelViewIntent

struct MainFeedSectionModel: SectionModel {
    typealias ParentViewState = MainFeedViewModelLink.MainFeedViewState
    
    static var isPaging: Bool = false
    
    static var numberOfSections: Int! = 1
    
    static var interItemSpacing: CGFloat! = 0

    static var registrationItems: [(AnyClass?, String)] = [(MainFeedEventsItem.self, MainFeedEventsItem.identifier)]
    static var actionForViewState: (MainFeedViewModelLink.MainFeedViewState, MainFeedViewModelLink.MainFeedViewState?, UICollectionView) -> Void = {
        viewState, prevViewState, collection in
    }
    var viewState: MainFeedViewModelLink.MainFeedViewState!
    
    func numberOfItems(section: Int) -> Int { return 1}
    
    func headerSize(path: IndexPath) -> CGSize { return .zero}
    
    func itemSize(reference: CGSize, indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: reference.width, height: reference.height*0.5)
    }
    
    func implementCell<Listener: ItemListener>(for item: ItemType, indexPath: IndexPath, listener: Listener) {
        guard let state = viewState else { return }
        let viewModel = ViewModel<MainFeedEventsItemViewModel>()
        viewModel.intent.accept(.initial(events: state.events))
        let presenter = ItemPresenter<MainFeedEventsItemPresenter>(item: item as? MainFeedEventsItem)
        (item as? MainFeedEventsItem)?.presenter = presenter
        (item as? MainFeedEventsItem)?.viewModel = viewModel
        presenter.bindViewModel(viewModel: viewModel, listener: listener)
    }
    
    func willEndDragging<Listener>(referenceSize: CGSize, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>, listener: Listener) where Listener : ItemListener {}
}

extension MainFeedSectionModel {
    enum Order {
        case account
        case events
    }
}
