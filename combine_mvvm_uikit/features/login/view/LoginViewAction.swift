//
//  LoginViewAction.swift
//  combine_mvvm_uikit
//
//  Created by Johan Boqvist on 2022-11-13.
//

import Foundation
import UIKit

enum LoginViewAction {
    case invalidUsernameOrPassword
}

extension LoginViewAction {
    func ok(viewController: UIViewController) {
        switch self {
        case .invalidUsernameOrPassword:
            let alertController = UIAlertController(
                title: "Failed to login",
                message: "Wrong username or password!",
                preferredStyle: .alert
            )

            let action = UIAlertAction(title: "OK", style: .default)
            alertController.addAction(action)

            viewController.present(alertController, animated: true)
        }
    }
}
