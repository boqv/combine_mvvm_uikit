//
//  KeyValueStore.swift
//  combine_mvvm_uikit
//
//  Created by Johan Boqvist on 2022-11-14.
//

import Foundation

protocol KeyValueStoreType: AnyObject {
    var token: String? { get set }
}

class KeyValueStore: KeyValueStoreType {
    func set(value: String?, forKey key: String) {
        UserDefaults.standard.set(value, forKey: key)
    }

    func get(key: String) -> String? {
        UserDefaults.standard.string(forKey: key)
    }
}

extension KeyValueStore {
    var token: String? {
        get {
            get(key: AppKey.token)
        }
        set {
            set(value: newValue, forKey: AppKey.token)
        }
    }
}
