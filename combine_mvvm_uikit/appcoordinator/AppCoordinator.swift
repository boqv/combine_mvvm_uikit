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
    let navigationController = Container.navigationController()

    func navigate(_ state: AppCoordinatorState) {
        switch state {
        case .login:
            showLogin()
        case .home:
            showHome()
        }
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
