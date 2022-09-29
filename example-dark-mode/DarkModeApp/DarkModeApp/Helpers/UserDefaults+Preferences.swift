//
//  UserDefaults+Preferences.swift
//  DarkModeApp
//
//  Created by adrian.florescu on 29.09.2022.
//

import Foundation

extension UserDefaults {
    private enum Keys {
        static let darkModePreference = "darkModePreference"
    }

    @objc dynamic var darkModePreference: Int {
        get {
            integer(forKey: Keys.darkModePreference)
        }
        set {
            set(newValue, forKey: Keys.darkModePreference)
        }
    }
}
