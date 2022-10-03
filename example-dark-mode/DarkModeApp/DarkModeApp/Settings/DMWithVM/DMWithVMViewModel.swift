//
//  DMWithVMViewModel.swift
//  DarkModeApp
//
//  Created by adrian.florescu on 29.09.2022.
//

import UIKit

class DMWithVMViewModel {
    var model: [(name: String, style: UIUserInterfaceStyle, isSelected: Bool)]
    let userDefaults: UserDefaults

    init(style: UIUserInterfaceStyle, userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults

        self.model = [
            (name: "Unspecified", style: .unspecified, isSelected: style == .unspecified),
            (name: "Dark", style: .dark, isSelected: style == .dark),
            (name: "Light", style: .light, isSelected: style == .light) ]
    }

    var selectedIndex: Int? {
        return model.firstIndex(where: \.isSelected)
    }

    func didSelectRow(at index: Int, completion: () -> ()) {
        userDefaults.darkModePreference = model[index].style.rawValue

        if let selectedIndex = selectedIndex {
            model[selectedIndex].isSelected = false
        }
        model[index].isSelected = true

        completion()
    }
}
