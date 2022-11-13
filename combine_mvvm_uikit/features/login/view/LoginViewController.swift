//
//  LoginViewController.swift
//  combine_mvvm_uikit
//
//  Created by Johan Boqvist on 2022-09-10.
//

import UIKit
import Factory
import Combine

class LoginViewController: UIViewController {
    private let viewModel = Container.loginViewModel()

    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var loginButton: UIButton!

    private var cancellables = Set<AnyCancellable>()

    init() {
        super.init(nibName: String(describing: LoginViewController.self), bundle: .main)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        observeUserInterface()
        observeViewModel()
    }

    private func observeUserInterface() {
        usernameTextField.textPublisher
            .assign(to: \.value, on: viewModel.username)
            .store(in: &cancellables)

        passwordTextField.textPublisher
            .assign(to: \.value, on: viewModel.password)
            .store(in: &cancellables)
    }

    private func observeViewModel() {
        viewModel.shouldEnableLogin
            .receive(on: RunLoop.main)
            .assign(to: \.isEnabled, on: loginButton)
            .store(in: &cancellables)

        viewModel.viewAction
            .receive(on: RunLoop.main)
            .sink { [weak self] viewAction in
                self?.handle(viewAction: viewAction)
            }
            .store(in: &cancellables)
    }

    private func handle(viewAction: LoginViewAction) {
        switch viewAction {

        case .invalidUsernameOrPassword:
            viewAction.ok(viewController: self)
        }
    }

    @IBAction func loginButtonTapped(_ sender: Any) {
        view.endEditing(true)

        Task {
            await viewModel.login()
        }
    }
}
