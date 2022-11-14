//
//  NewsViewController.swift
//  combine_mvvm_uikit
//
//  Created by Johan Boqvist on 2022-11-14.
//

import UIKit

class NewsViewController: UIViewController {
    init() {
        super.init(nibName: String(describing: NewsViewController.self), bundle: .main)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
