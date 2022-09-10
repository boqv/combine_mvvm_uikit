//
//  LoginViewModel.swift
//  combine_mvvm_uikit
//
//  Created by Johan Boqvist on 2022-09-10.
//

import Foundation
import Factory
import Combine

class LoginViewModel {
    private let authenticationService = Container.authenticationService()
    private let coordinator = Container.appCoordinator()

    let username = CurrentValueSubject<String?, Never>("")
    let password = CurrentValueSubject<String?, Never>("")

    func login() async {
        let result = await authenticationService.authorize(
            username: username.value ?? "",
            password: password.value ?? ""
        )

        switch result {

        case .success(let token):
            print(token)
            coordinator.navigate(.home)

        case .failure(let error):
            print(error.localizedDescription)
        }
    }
}
