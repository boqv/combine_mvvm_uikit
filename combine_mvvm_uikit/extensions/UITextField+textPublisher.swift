//
//  UITextField+textPublisher.swift
//  combine_mvvm_uikit
//
//  Created by Johan Boqvist on 2022-09-11.
//

import UIKit
import Combine
import Foundation

extension UITextField {
    var textPublisher: AnyPublisher<String?, Never> {
        NotificationCenter.default.publisher(
            for: UITextField.textDidChangeNotification,
            object: self
        )
        .map { ($0.object as? UITextField)?.text }
        .eraseToAnyPublisher()
    }
}
