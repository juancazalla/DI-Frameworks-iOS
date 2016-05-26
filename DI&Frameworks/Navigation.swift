//
//  Navigation.swift
//  DI&Frameworks
//
//  Created by Juan Cazalla Estrella on 5/5/16.
//  Copyright © 2016 Juan Cazalla Estrella. All rights reserved.
//

import UIKit

extension UIViewController {
    func presentViewController<T:UIViewController>(viewControllerType: T.Type) {
        let viewController = DependenciesContainer.resolve(viewControllerType)
        presentViewController(viewController, animated: true, completion: nil)
    }
}
