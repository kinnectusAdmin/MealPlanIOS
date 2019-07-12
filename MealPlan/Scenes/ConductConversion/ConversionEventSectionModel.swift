//
//  ConversionEventSectionModel.swift
//  MealPlan
//
//  Created by blakerogers on 6/10/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import UIKit
import CleanModelViewIntent

struct ConversionEventSectionModel: SectionModel {
    typealias ParentViewState = ConversionViewModel.Link.ConversionViewState
    static var isPaging: Bool = false
    
    static var numberOfSections: Int! = 1
    
    static var interItemSpacing: CGFloat! = 0
    
    static var minimumLineSpacing: CGFloat = 0
    
    static var registrationItems: [(AnyClass?, String)] = [(EventItem.self, EventItem.identifier)]
    
    static var actionForViewState: (ParentViewState, ParentViewState?, UICollectionView) -> Void =
    {
        viewState, previousViewState, collection in
        collection.reloadData()
    }
    
    var viewState: ParentViewState!
    
    func numberOfItems(section: Int) -> Int {
        return viewState?.pastConversions.count ?? 0
    }
    
    func headerSize(path: IndexPath) -> CGSize {
        return .zero
    }
    
    func itemSize(reference: CGSize, indexPath: IndexPath) -> CGSize {
        return CGSize(width: reference.width, height: EventItem.Layout.itemHeight)
    }
    
    func item(collection: UIView, indexPath: IndexPath) -> UIView {
        guard let item = (collection as? UICollectionView)?.dequeueReusableCell(withReuseIdentifier: EventItem.identifier, for: indexPath) as? EventItem else { return UICollectionViewCell()}
        return item
    }
    
    func implementCell<Listener>(for item: UIView, indexPath: IndexPath, listener: Listener) where Listener : ItemListener {
        guard let item = item as? EventItem else { return }
        let event = viewState.pastConversions[indexPath.item]
        let viewModel = ItemViewModel<ConversionEventItemViewModel>()
        viewModel.intent.accept(.initial(event: event))
        let presenter = ItemPresenter<ConversionEventItemPresenter>(item: item)
        item.viewModel = viewModel
        item.presenter = presenter
        presenter.bindViewModel(viewModel: viewModel, listener: listener)
    }
    
    func willEndDragging<Listener>(referenceSize: CGSize, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>, listener: Listener) where Listener : ItemListener {
        
    }
    
    
    
    
}

