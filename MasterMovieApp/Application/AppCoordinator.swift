//
//  AppCoordinator.swift
//  JSZindigi
//
//  Created by Anis Ur Rehman on 14/06/2023.
//

import Foundation
import UIKit

class AppCoordinator {
    let window: UIWindow
    let viewControllerFactory: ViewControllerFactoryProtocol
    var navigationController: UINavigationController!

    
    init(window: UIWindow, viewControllerFactory: ViewControllerFactoryProtocol) {
        self.window = window
        self.viewControllerFactory = viewControllerFactory
    }
    
    func start() {
        startApp()
    }
}

extension AppCoordinator {
    fileprivate func startApp() {
        navigationController = UINavigationController()
        let viewController = viewControllerFactory.movieListViewController(navigationController: navigationController)
        navigationController.pushViewController(viewController, animated: false)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
}
