//
//  AppDelegate.swift
//  TheCatsLibrary
//
//  Created by Mauro Coletes on 24/08/20.
//  Copyright © 2020 Mauro Coletes. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       
        let rootNC = UINavigationController(rootViewController: CatsListViewController())
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = rootNC
        self.window?.makeKeyAndVisible()
        
        return true
    }

}

