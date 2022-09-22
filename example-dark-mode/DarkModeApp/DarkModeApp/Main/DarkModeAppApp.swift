//
//  DarkModeAppApp.swift
//  DarkModeApp
//
//  Created by adrian.florescu on 22.09.2022.
//

import SwiftUI

@main
struct DarkModeAppApp: App {
    @UIApplicationDelegateAdaptor var delegate: AppDelegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}