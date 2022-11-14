//
//  NotesViewController.swift
//  combine_mvvm_uikit
//
//  Created by Johan Boqvist on 2022-11-14.
//

import UIKit

class NotesViewController: UIViewController {
    init() {
        super.init(
            nibName: String(describing: NotesViewController.self),
            bundle: .main
        )
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
