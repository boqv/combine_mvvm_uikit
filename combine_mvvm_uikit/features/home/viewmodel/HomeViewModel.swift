//
//  HomeViewModel.swift
//  combine_mvvm_uikit
//
//  Created by Johan Boqvist on 2022-09-10.
//

import Foundation
import Combine
import Factory

class HomeViewModel {
    private let appCoordinator = Container.appCoordinator()

    func logout() {
        appCoordinator.navigate(.login)
    }
}
