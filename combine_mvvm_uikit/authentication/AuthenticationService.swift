//
//  AuthenticationService.swift
//  combine_mvvm_uikit
//
//  Created by Johan Boqvist on 2022-09-10.
//

import Foundation

protocol AuthenticationServiceType {
    func authorize(
        username: String,
        password: String
    ) async -> Result<String, Error>
}

class AuthenticationService: AuthenticationServiceType {
    func authorize(username: String, password: String) async -> Result<String, Error> {

        guard username == "johan" && password == "test123" else {
            return .failure(
                AuthenticationServiceError.invalidUsernameOrPassword
            )
        }
        return .success("some_stupid_access_token")
    }
}
