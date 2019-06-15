//
//  MainFeedEventsSectionModel.swift
//  MealPlan
//
//  Created by blakerogers on 6/4/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//
import Foundation
import CleanModelViewIntent
import MealPlanDomain
import Utilities

struct MainFeedEventsSectionModel: SectionModel {
    
    typealias ParentViewState = MainFeedEventsItemViewModelLink.ItemViewState
    
    static var isPaging: Bool = false
    
    static var numberOfSections: Int! = 1
    
    static var interItemSpacing: CGFloat! = 0
    
    static var minimumLineSpacing: CGFloat = 0
    
    static var registrationItems: [(AnyClass?, String)] = [(MainFeedEventItem.self, MainFeedEventItem.identifier)]
    
    static var actionForViewState: (MainFeedEventsItemViewModelLink.ItemViewState, MainFeedEventsItemViewModelLink.ItemViewState?, UICollectionView) -> Void = {
        viewState, prevViewState, collection in
    }
    var viewState: MainFeedEventsItemViewModelLink.ItemViewState!
    
    func numberOfItems(section: Int) -> Int { return viewState?.events.count ?? 0 }
    
    func headerSize(path: IndexPath) -> CGSize { return .zero }
    
    func itemSize(reference: CGSize, indexPath: IndexPath) -> CGSize {
        return CGSize(width: reference.width, height: MainFeedEventItem.Layout.itemHeight)
    }
    func item(collection: UIView, indexPath: IndexPath) -> UIView {
        guard let collection = collection as? UICollectionView else { return UICollectionViewCell()}
        return collection.dequeueReusableCell(withReuseIdentifier: MainFeedEventItem.identifier, for: indexPath)
    }
    func implementCell<Listener>(for item: UIView, indexPath: IndexPath, listener: Listener) where Listener : ItemListener {
        guard var item = item as? MainFeedEventItem, let events = viewState?.events else { return }
        let event = events[indexPath.item]
        let viewModel = ViewModel<MainFeedEventItemViewModel>()
        viewModel.intent.accept(.initial(event: event))
        let presenter = ItemPresenter<MainFeedEventItemPresenter>(item: item)
        item.presenter = presenter
        item.viewModel = viewModel
        presenter.bindViewModel(viewModel: viewModel, listener: listener)
    }
    func willEndDragging<Listener>(referenceSize: CGSize, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>, listener: Listener) where Listener : ItemListener {}
}
