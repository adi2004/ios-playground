//
//  AppDelegate.swift
//  Stars
//
//  Created by Adrian Florescu on 20.04.16.
//  Copyright © 2016 infloresc.ro. All rights reserved.
//

import UIKit

extension k {
    struct AppDelegateStuff {
        let x = 3.0
    }
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?

  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
//        window = UIWindow(frame: UIScreen.mainScreen().bounds)
//        let table:StarsTableViewController = StarsTableViewController()
//        let nvc:UINavigationController = UINavigationController(rootViewController: table)
//        table.navigationItem.title = "Romb"
//        window!.rootViewController = nvc
//        window!.backgroundColor = UIColor.redColor()
//        window!.makeKeyAndVisible()
    
//    print(k.path.newK)
//    print(k.AppDelegateStuff.x)
    print(k.multiplierIdentity)
    
    return true
  }
}

