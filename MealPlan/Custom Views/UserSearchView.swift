//
//  UserSearchView.swift
//  MealPlan
//
//  Created by blakerogers on 6/8/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import UIKit
import CleanModelViewIntent
import Utilities

protocol UserSearchViewType {
    var dismissButton: UXButton { get set }
    var searchBar: UXTextField { get set }
    var searchCollection: UXCollectionView<UserSearchViewSectionModel> { get set }
    func render() -> UIView
}
class UserSearchView: UIView, UserSearchViewType {
    
    var dismissButton: UXButton = Icons.dropDownButton
    
    var searchBar: UXTextField = UXTextField.field(textColor: ViewProperties.searchColor, background: .clear, font: ViewProperties.searchFont, placeholder: "Search", alignment: .center, borderColor: ViewProperties.searchBorderColor, radius: Layout.searchCornerRadius)
    
    var searchCollection = UXCollectionView<UserSearchViewSectionModel>(model: nil, frame: CGRect(origin: .zero, size: CGSize(width: UIScreen.main.bounds.width, height: 400)))
    
    func render() -> UIView { return self }

}
extension UserSearchView {
    override func layoutSubviews() {
        super.layoutSubviews()
        setViews()
    }
    private func setViews() {
        add(views: dismissButton, searchBar, searchCollection)
        dismissButton.constrainTopToTop(of: self, constant: Layout.dismissButtonTopOffset)
        dismissButton.constrainCenterXTo(view: self, constant: 0)
        searchBar.constrainTopToBottom(of: dismissButton, constant: Layout.searchBarTopOffset)
        searchBar.constrainCenterXTo(view: self, constant: 0)
        searchBar.constrainWidth_Height(width: Layout.searchSize.width, height: Layout.searchSize.height)
        searchCollection.constrainInView(view: self, left: 0, right: 0, bottom: 0)
        searchCollection.constrainTopToBottom(of: searchBar, constant: Layout.searchCollectionTopOffset)
    }
}
extension UserSearchView {
    static func view() -> UserSearchView {
        let view = UserSearchView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
}
extension UserSearchView {
    struct ViewProperties {
        static let background: UIColor = .clear
        static let searchColor: UIColor = UIColor.App.currentScheme.colors.dark
        static let searchBorderColor: UIColor = UIColor.App.currentScheme.colors.dark
        static let searchFont: UIFont = UIFont.App.currentFont.fonts.small
    }
    struct Layout {
        static let dismissButtonTopOffset: CGFloat = 20
        static let searchBarTopOffset: CGFloat = 20
        static let searchSize: WidthHeight = (250, 30)
        static let searchCollectionTopOffset: CGFloat = 20
        static let searchCornerRadius: CGFloat = searchSize.height*0.5
    }
}

