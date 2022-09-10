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

    func showInitial() {
        let viewController = HomeViewController()
        navigationController.pushViewController(viewController, animated: false)
    }
}
