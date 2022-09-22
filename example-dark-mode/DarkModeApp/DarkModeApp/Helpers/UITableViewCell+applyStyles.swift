//
//  UITableViewCell+applyStyles.swift
//  DarkModeApp
//
//  Created by adrian.florescu on 22.09.2022.
//

import UIKit

extension UITableViewCell {
    func applyStyles() {
        self.backgroundColor = UIColor(named: "Background")
        self.tintColor = UIColor(named: "Text")
        self.textLabel?.textColor = UIColor(named: "Text")
    }
}
