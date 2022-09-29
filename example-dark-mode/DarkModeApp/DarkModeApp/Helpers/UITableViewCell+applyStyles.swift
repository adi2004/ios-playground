//
//  UITableViewCell+applyStyles.swift
//  DarkModeApp
//
//  Created by adrian.florescu on 22.09.2022.
//

import UIKit

extension UITableViewCell {
    func applyStyles() {
        self.backgroundColor = .dyBackground
        self.tintColor = .dyText
        self.textLabel?.textColor = .dyText
    }
}

extension UITableViewController {
    func applyStyles() {
        self.view.backgroundColor = .dyBackground
    }
}
