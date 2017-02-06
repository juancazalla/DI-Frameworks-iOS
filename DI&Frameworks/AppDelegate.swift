//
//  AppDelegate.swift
//  DI&Frameworks
//
//  Created by Juan Cazalla Estrella on 25/5/16.
//  Copyright © 2016 Juan Cazalla Estrella. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var dependenciesContainer: DependenciesContainer!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        self.dependenciesContainer = DependenciesContainer.sharedInstance
        dependenciesContainer.registerDependencies()

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        let searchViewController: SearchViewController = dependenciesContainer.resolve()
        let navigationController = UINavigationController(rootViewController: searchViewController)
        window?.rootViewController = navigationController

        return true
    }
}
