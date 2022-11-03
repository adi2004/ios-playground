//
//  UIColor+Random.swift
//  DarkModeApp
//
//  Created by adrian.florescu on 24.10.2022.
//

import UIKit

private var r = CGFloat.random(in: 0 ..< 1)
private var g = CGFloat.random(in: 0 ..< 1)
private var b = CGFloat.random(in: 0 ..< 1)
private let delta = 0.01

extension UIColor {
    static var random: UIColor {
        r = (1 + r + CGFloat.random(in: 0 ..< delta) - delta / 2).truncatingRemainder(dividingBy: 1)
        g = (1 + g + CGFloat.random(in: 0 ..< delta) - delta / 2).truncatingRemainder(dividingBy: 1)
        b = (1 + b + CGFloat.random(in: 0 ..< delta) - delta / 2).truncatingRemainder(dividingBy: 1)
//        print("r g b", r, g, b)
        return UIColor.init(red: r, green: g, blue: b, alpha: 1.0)
    }
}
