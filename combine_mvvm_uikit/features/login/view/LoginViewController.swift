//
//  LoginViewController.swift
//  combine_mvvm_uikit
//
//  Created by Johan Boqvist on 2022-09-10.
//

import UIKit
import Factory

class LoginViewController: UIViewController {
    private let coordinator = Container.appCoordinator()

    init() {
        super.init(nibName: String(describing: LoginViewController.self), bundle: .main)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func loginButtonTapped(_ sender: Any) {
        coordinator.navigate(.home)
    }
}
