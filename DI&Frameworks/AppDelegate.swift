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
    let assembler: Assembler = AppAssembler()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
		let searchMoviesNavigator = SearchMoviesNavigator(assembler: assembler)
		searchMoviesNavigator.navigateToSearchMovies(window: window)

        return true
    }
}
