//
//  AuthenticationServiceError.swift
//  combine_mvvm_uikit
//
//  Created by Johan Boqvist on 2022-09-10.
//

import Foundation

enum AuthenticationServiceError: Error {
    case invalidUsernameOrPassword
}

extension AuthenticationServiceError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidUsernameOrPassword:
            return "Invalid username or password"
        }
    }
}
