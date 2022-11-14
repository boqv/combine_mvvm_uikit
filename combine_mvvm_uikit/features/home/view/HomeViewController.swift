//
//  HomeViewController.swift
//  combine_mvvm_uikit
//
//  Created by Johan Boqvist on 2022-09-10.
//

import UIKit
import Combine
import Factory

class HomeViewController: UITabBarController {
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

        configureUserInterface()
    }

    private func configureUserInterface() {
        configureTabbar()
    }

    private func configureTabbar() {
        delegate = self

        let newsTabBarItem = UITabBarItem(
            tabBarSystemItem: .featured,
            tag: 0
        )
        let noteTabBarItem = UITabBarItem(
            tabBarSystemItem: .history,
            tag: 1
        )
        let newsViewController = NewsViewController()
        newsViewController.tabBarItem = newsTabBarItem

        let notesViewController = NotesViewController()
        notesViewController.tabBarItem = noteTabBarItem

        viewControllers = [
            newsViewController,
            notesViewController
        ]
    }

    @IBAction func logoutButtonTapped(_ sender: Any) {
        viewModel.logout()
    }
}

extension HomeViewController: UITabBarControllerDelegate {

}
