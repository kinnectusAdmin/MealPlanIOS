//
//  UserSearchViewSectionModel.swift
//  MealPlan
//
//  Created by blakerogers on 6/8/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
import Utilities
import UIKit
import CleanModelViewIntent

struct UserSearchViewSectionModel: SectionModel {
    
    typealias ParentViewState = TransferViewModel.Link.ViewStateType
    
    static var isPaging: Bool = false
    
    static var numberOfSections: Int! = 1
    
    static var interItemSpacing: CGFloat! = 0
    
    static var minimumLineSpacing: CGFloat = 0
    
    static var registrationItems: [(AnyClass?, String)] = [(UserSearchItem.self, UserSearchItem.identifier)]
    
    static var actionForViewState: (ParentViewState, ParentViewState?, UICollectionView) -> Void =
    {
        _, _ , collection in
        collection.reloadData()
    }
    
    var viewState: ParentViewState!
    
    func numberOfItems(section: Int) -> Int {
        return viewState?.userSearchResults.count ?? 0
    }
    
    func headerSize(path: IndexPath) -> CGSize {
        return .zero
    }
    
    func itemSize(reference: CGSize, indexPath: IndexPath) -> CGSize {
        return UserSearchItem.Layout.itemSize
    }
    
    func implementCell<Listener>(for item: UIView, indexPath: IndexPath, listener: Listener) where Listener : ItemListener {
        guard let item = item as? UserSearchItem else { return }
        let viewModel = ViewModel<UserSearchItemViewModel>()
        let user = viewState.userSearchResults[indexPath.item]
        viewModel.intent.accept(.initial(user: user))
        let presenter = ItemPresenter<UserSearchViewItemPresenter>(item: item)
        item.viewModel = viewModel
        item.presenter = presenter
        presenter.bindViewModel(viewModel: viewModel, listener: listener)
    }
    
    func willEndDragging<Listener>(referenceSize: CGSize, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>, listener: Listener) where Listener : ItemListener {
    }
    
    func item(collection: UIView, indexPath: IndexPath) -> UIView {
        guard let collection = collection as? UICollectionView else { return UICollectionViewCell()}
        return collection.dequeueReusableCell(withReuseIdentifier: UserSearchItem.identifier, for: indexPath)
    }
    
}
