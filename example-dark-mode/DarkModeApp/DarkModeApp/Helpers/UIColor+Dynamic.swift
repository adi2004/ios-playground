//
//  UIColor+Dynamic.swift
//  DarkModeApp
//
//  Created by adrian.florescu on 29.09.2022.
//

import UIKit

extension UIColor {
    static func getColor(_ named: String) -> UIColor {
        if let c = UIColor(named: named) {
            return c
        } else {
            assertionFailure("Color not found with name \'\(named)\'")
            return .clear
        }
    }
    static var dyBackground: UIColor { getColor("Background") }
    static var dyText: UIColor { getColor("Text") }
}
