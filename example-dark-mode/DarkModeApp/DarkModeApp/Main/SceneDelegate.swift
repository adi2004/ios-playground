//
//  SceneDelegate.swift
//  DarkModeApp
//
//  Created by adrian.florescu on 29.09.2022.
//

import UIKit

class SceneDelegate: NSObject, ObservableObject, UIWindowSceneDelegate {
    var window: UIWindow?   // << contract of `UIWindowSceneDelegate`

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        print("== SceneDelegate.willConnectTo")
        guard let windowScene = scene as? UIWindowScene else { return }
        if #available(iOS 15.0, *) {
            self.window = windowScene.keyWindow
            let style = UIUserInterfaceStyle(rawValue: UserDefaults.standard.darkModePreference) ?? .unspecified
            self.window?.overrideUserInterfaceStyle = style
        } else {
            // ?
        }
    }
}
