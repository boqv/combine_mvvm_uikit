//
//  AppCoordinator.swift
//  combine_mvvm_uikit
//
//  Created by Johan Boqvist on 2022-09-10.
//

import Foundation
import Combine
import UIKit
import Factory

class AppCoordinator {
    private let navigationController = Container.navigationController()
    private let keyValueStore = Container.keyValueStore()

    func navigate(_ state: AppCoordinatorState) {
        switch state {
        case .login:
            showLogin()
        case .home:
            showHome()
        }
    }

    func showIntial() {
        guard keyValueStore.token != nil else {
            showLogin()
            return
        }

        showHome()
    }

    private func showHome() {
        let viewController = HomeViewController()

        pushToRoot(viewController: viewController)
    }

    func showLogin() {
        let viewController = LoginViewController()

        pushToRoot(viewController: viewController)
    }
}

extension AppCoordinator {
    private func pushToRoot(viewController: UIViewController) {
        navigationController.viewControllers.removeAll()
        navigationController.pushViewController(
            viewController,
            animated: true
        )
    }
}
