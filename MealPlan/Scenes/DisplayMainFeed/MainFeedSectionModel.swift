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
    
    static var minimumLineSpacing: CGFloat = 20
    
    static var registrationItems: [(AnyClass?, String)] =
        [(MainFeedEventsItem.self, MainFeedEventsItem.identifier),
        (MainFeedAccountItem.self, MainFeedAccountItem.identifier),
        (MainFeedGraphItem.self, MainFeedGraphItem.identifier)]
    
    static var actionForViewState: (MainFeedViewModelLink.MainFeedViewState, MainFeedViewModelLink.MainFeedViewState?, UICollectionView) -> Void = {
        viewState, prevViewState, collection in
    }
    var viewState: MainFeedViewModelLink.MainFeedViewState!
    
    func numberOfItems(section: Int) -> Int {
        return 3
    }
    
    func headerSize(path: IndexPath) -> CGSize { return .zero}
    
    func item(collection: UIView, indexPath: IndexPath) -> UIView {
        guard let collection = collection as? UICollectionView else { return UICollectionViewCell()}
        switch Order(rawValue: indexPath.item) {
        case .account?:
            return collection.dequeueReusableCell(withReuseIdentifier: MainFeedAccountItem.identifier, for: indexPath)
        case .events?:
            return collection.dequeueReusableCell(withReuseIdentifier: MainFeedEventsItem.identifier, for: indexPath)
        case .graph?:
            return collection.dequeueReusableCell(withReuseIdentifier: MainFeedGraphItem.identifier, for: indexPath)
        default: return UICollectionViewCell()
        }
    }
    
    func itemSize(reference: CGSize, indexPath: IndexPath) -> CGSize {
        switch Order(rawValue: indexPath.item) ?? .events {
        case .account:
            return CGSize(width: reference.width, height: MainFeedAccountItem.Layout.itemHeight)
        case .events:
            let numberOfEvents = viewState?.events.count ?? 0
            return CGSize(width: reference.width, height: MainFeedEventItem.Layout.itemHeight*CGFloat(numberOfEvents) + 90)
        case .graph:
            return CGSize(width: reference.width, height: MainFeedGraphItem.Layout.itemHeight)
        }
    }
    
    func implementCell<Listener: ItemListener>(for item: UIView, indexPath: IndexPath, listener: Listener) {
        guard let state = viewState else { return }
        switch Order(rawValue: indexPath.item) {
        case .account?:
            let viewModel = ItemViewModel<MainFeedAccountItemViewModel>()
            viewModel.intent.accept(.initial(account: state.account))
            let presenter = ItemPresenter<MainFeedAccountItemPresenter>(item: item as? MainFeedAccountItem)
            (item as? MainFeedAccountItem)?.presenter = presenter
            (item as? MainFeedAccountItem)?.viewModel = viewModel
            presenter.bindViewModel(viewModel: viewModel, listener: listener)
        case .events?:
            let viewModel = ItemViewModel<MainFeedEventsItemViewModel>()
            viewModel.intent.accept(.initial(events: state.events))
            let presenter = ItemPresenter<MainFeedEventsItemPresenter>(item: item as? MainFeedEventsItem)
            (item as? MainFeedEventsItem)?.presenter = presenter
            (item as? MainFeedEventsItem)?.viewModel = viewModel
            presenter.bindViewModel(viewModel: viewModel, listener: listener)
        case .graph?:
            let viewModel = ItemViewModel<MainFeedGraphItemViewModel>()
            viewModel.intent.accept(.initial(balances: []))
            let presenter = ItemPresenter<MainFeedGraphItemPresenter>(item: item as? MainFeedGraphItem)
            (item as? MainFeedGraphItem)?.presenter = presenter
            (item as? MainFeedGraphItem)?.viewModel = viewModel
            presenter.bindViewModel(viewModel: viewModel, listener: listener)
        default: break
        }
    }
    
    func willEndDragging<Listener>(referenceSize: CGSize, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>, listener: Listener) where Listener : ItemListener {}
}

extension MainFeedSectionModel {
    enum Order: Int {
        case account = 0
        case events
        case graph
    }
}
