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
    private let keyValueStore = Container.keyValueStore()

    let username = CurrentValueSubject<String?, Never>("")
    let password = CurrentValueSubject<String?, Never>("")

    let viewAction = PassthroughSubject<LoginViewAction, Never>()

    func login() async {
        let result = await authenticationService.authorize(
            username: username.value ?? "",
            password: password.value ?? ""
        )

        switch result {

        case .success(let token):
            print(token)
            keyValueStore.token = token
            coordinator.navigate(.home)

        case .failure(let error):
            print(error.localizedDescription)
            viewAction.send(.invalidUsernameOrPassword)
        }
    }
}

extension LoginViewModel {
    var shouldEnableLogin: AnyPublisher<Bool, Never> {
        return Publishers.CombineLatest(username, password)
            .map { username, password in
                guard let username = username, let password = password else {
                    return false
                }

                return !username.isEmpty && !password.isEmpty
            }.eraseToAnyPublisher()
    }
}
