//
//  UserSeachViewItemPresenter.swift
//  MealPlan
//
//  Created by blakerogers on 6/8/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
import CleanModelViewIntent

struct UserSearchViewItemPresenter: ItemPresenterLink {
    typealias View = UserSearchItemType
    typealias Link = UserSearchViewItemViewModelLink
    static var action: (UserSearchViewItemViewModelLink.ItemViewState?, UserSearchViewItemViewModelLink.ItemViewState?, UserSearchItemType) -> Void =
    {
        viewState, _, item in
        item.nameLabel.text = viewState?.userName
        item.avatar.loadImageWithURL(url: viewState?.userImage ?? "", defaultImage: AppImages.person.image())
    }
    static var interaction: (UserSearchItemType, Box<UserSearchViewItemViewModelLink.ItemIntent?>) -> Void =
    {
        item, interactor in
        item.avatar.imageView.addTapGestureRecognizer(action: {
            //TODO: Pass intent for selection of item to viewmodel
        })
    }
}
