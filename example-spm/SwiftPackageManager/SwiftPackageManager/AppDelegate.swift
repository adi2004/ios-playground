//
//  AppDelegate.swift
//  SwiftPackageManager
//
//  Created by adrian.florescu on 09/07/2020.
//  Copyright © 2020 infloresc. All rights reserved.
//

import UIKit
import Moya

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        print("doing something")
        request()
        requestHTTPBin()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}

extension AppDelegate {
    func request() -> String {
        let provider = MoyaProvider<PostmanEchoTargetType>()
        provider.request(.getWithParams(paramA: "James", paramB: "Potter")) { result in
            print("PostmanEchoTargetType result: \(result)")
            switch result {
            case .success(let response):
                print("PostmanEchoTargetType response: \(String(data: response.data, encoding: String.Encoding.utf8) ?? "")")
            case .failure(let error):
                print("PostmanEchoTargetType error: \(error)")
            }
        }

        // The full request will result to the following:
        // POST https://api.myservice.com/users
        // Request body:
        // {
        //   "first_name": "James",
        //   "last_name": "Potter"
        // }

        provider.request(.get) { result in
            // do something with the result (read on for more details)
            print("result get: \(result)")
//            print("result get data: \(result)")
        }

        // The full request will result to the following:
        // POST https://api.myservice.com/users/123?first_name=Harry&last_name=Potter
        
        return "world"
    }
    
    func requestHTTPBin() {
        let provider = MoyaProvider<HTTPBinTargetType>()
        provider.request(HTTPBinTargetType()) { result in
            print("HTTPBinTargetType result: \(result)")

            switch result {
            case .success(let response):
                print("HTTPBinTargetType response: \(String(data: response.data, encoding: String.Encoding.utf8) ?? "")")
            case .failure(let error):
                print("HTTPBinTargetType error: \(error)")
            }
        }
    }
}

