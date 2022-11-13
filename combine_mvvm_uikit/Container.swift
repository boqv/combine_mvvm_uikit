//
//  Container.swift
//  combine_mvvm_uikit
//
//  Created by Johan Boqvist on 2022-09-10.
//

import Foundation
import Factory
import UIKit

extension Container {
    static let navigationController = Factory<UINavigationController>(
        scope: .singleton
    ) {
        UINavigationController()
    }
    static let appCoordinator = Factory<AppCoordinator>(scope: .singleton){
        AppCoordinator()
    }

    // services
    static let authenticationService = Factory<AuthenticationServiceType>(
        scope: .singleton
    ) {
        AuthenticationService()
    }

    // view models
    static let homeViewModel = Factory<HomeViewModel>{ HomeViewModel() }
    static let loginViewModel = Factory<LoginViewModel> { LoginViewModel() }
}
