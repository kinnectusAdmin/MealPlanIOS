//
//  OnboardSectionModel.swift
//  MealPlan
//
//  Created by blakerogers on 3/8/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
import Utilities
import MealPlanDomain
import CleanModelViewIntent
struct OnboardSectionModel: SectionModel {
    typealias ParentViewState = OnboardViewModelLink.OnboardViewState
    enum Items: Int {
        case first = 0
        case second
        case third
        var page: Objects.OnboardPage {
            return Objects.OnboardPage(rawValue: self.rawValue) ?? .first
        }
    }
    static var isPaging: Bool = true
    static var numberOfSections: Int! = 1
    static var interItemSpacing: CGFloat! = 0
    static var minimumLineSpacing: CGFloat = 0
    static var registrationItems: [(AnyClass?, String)] = [(OnboardItemView.self, OnboardItemView.identifier)]
    static var actionForViewState: (OnboardViewModelLink.OnboardViewState, OnboardViewModelLink.OnboardViewState?, UICollectionView) -> Void = {
        viewState, prevViewState, collection in
        
    }
    var viewState: OnboardViewModelLink.OnboardViewState!
    func numberOfItems(section: Int) -> Int { return 3 }
    func headerSize(path: IndexPath) -> CGSize { return .zero }
    func itemSize(reference: CGSize, indexPath: IndexPath) -> CGSize { return reference }
    func item(collection: UIView, indexPath: IndexPath) -> UIView {
        guard let collection = collection as? UICollectionView else { return UICollectionViewCell()}
        return collection.dequeueReusableCell(withReuseIdentifier: OnboardItemView.identifier, for: indexPath)
    }
    func implementCell<Listener: ItemListener>(for item: UIView, indexPath: IndexPath, listener: Listener) {
        let page = Items(rawValue: indexPath.item) ?? .first
        let viewModel = ItemViewModel<OnboardItemViewModel>()
        viewModel.intent.accept(OnboardItemViewModelLink.IntentType.initial(page: page.page))
        let presenter = ItemPresenter<OnboardItemPresenter>(item: item as? OnboardItemView)
        (item as? OnboardItemView)?.presenter = presenter
        (item as? OnboardItemView)?.viewModel = viewModel
        presenter.bindViewModel(viewModel: viewModel, listener: listener)
    }
    func willEndDragging<Listener>(referenceSize: CGSize, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>, listener: Listener) where Listener : ItemListener {
        let layoutWidth = referenceSize.width
        let contentOffset = targetContentOffset.pointee.x
        let page = Int(contentOffset/layoutWidth)
        guard let position = Objects.OnboardPage(rawValue: page) else { return }
        listener.parentInteractor.accept(OnboardViewModel.Link.OnboardIntent.didSwipeToPosition(position))
    }
}
