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

    private var cancellables = Set<AnyCancellable>()

    init() {
        super.init(nibName: String(describing: LoginViewController.self), bundle: .main)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        bindUserInterfaceToViewModel()
    }

    private func bindUserInterfaceToViewModel() {
        usernameTextField
            .publisher(for: \.text)
            .assign(to: \.value, on: viewModel.username)
            .store(in: &cancellables)

        passwordTextField
            .publisher(for: \.text)
            .assign(to: \.value, on: viewModel.password)
            .store(in: &cancellables)
    }

    @IBAction func loginButtonTapped(_ sender: Any) {
        view.endEditing(true)

        Task {
            await viewModel.login()
        }
    }
}
