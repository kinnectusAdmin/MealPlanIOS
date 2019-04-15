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

    typealias ParentCoordinator = OnboardCoordinator
    typealias Coordinator = OnboardItemCoordinator
    typealias HeaderFooterType = EmptySectionModelHeaderFooter
    
    enum Items: Int {
        case first = 0
        case second
        case third
        var page: Objects.OnboardPage {
            return Objects.OnboardPage(rawValue: self.rawValue) ?? .first
        }
    }
    
    let viewState: ParentCoordinator.Link.Link.ViewStateType?
    
    static var isPaging: Bool = true
    static var numberOfSections: Int! = 1
    static var interItemSpacing: CGFloat! = 0
    
    func presenter(item: OnboardItemView) -> ItemPresenter<Coordinator.ItemLink> {
        return ItemPresenter<Coordinator.ItemLink>(item: item)
    }
    func numberOfItems(section: Int) -> Int {
        return 3
    }
    func headerSize(path: IndexPath) -> CGSize {
        return .zero
    }
    func itemSize(reference: CGSize) -> CGSize {
        return reference
    }
    func header(path: IndexPath) -> EmptySectionModelHeaderFooter {
        return EmptySectionModelHeaderFooter(nil)
    }
    
    func footer(path: IndexPath) -> EmptySectionModelHeaderFooter {
        return EmptySectionModelHeaderFooter(nil)
    }
    func implementCoordinator<Listener: ItemListener>(for item: OnboardItemView, indexPath: IndexPath, listener: Listener) {
        let page = Items(rawValue: indexPath.item) ?? .first
        let presenter = self.presenter(item: item)
        let viewModel = ViewModel<OnboardItemViewModel>()
        viewModel.intent.accept(OnboardItemViewModelLink.IntentType.initial(page: page.page))
        presenter.bindViewModel(viewModel: viewModel, listener: listener)
    }
    func willEndDragging<Listener>(referenceSize: CGSize, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>, listener: Listener) where Listener : ItemListener {
        let layoutWidth = referenceSize.width
        let contentOffset = targetContentOffset.pointee.x
        let page = Int(contentOffset/layoutWidth)
        guard let position = Objects.OnboardPage(rawValue: page) else { return }
        listener.parentInteractor.accept(OnboardViewModel.Link.OnboardIntent.didSwipeToPosition(position) as? Listener.ParentIntentType)
    }
}
