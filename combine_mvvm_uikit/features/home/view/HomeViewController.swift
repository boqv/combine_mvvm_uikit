//
//  HomeViewController.swift
//  combine_mvvm_uikit
//
//  Created by Johan Boqvist on 2022-09-10.
//

import UIKit
import Combine
import Factory

class HomeViewController: UIViewController {
    private let viewModel: HomeViewModel = Container.homeViewModel()

    var cancellables = Set<AnyCancellable>()

    init() {
        super.init(nibName: String(describing: HomeViewController.self), bundle: .main)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
