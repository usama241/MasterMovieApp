//
//  MovieListCoordinator.swift
//  MasterMovieApp
//
//  Created by MacBook Pro on 01/07/2025.
//

import Foundation
import UIKit

class ZTagListCoordinator {
    
    let viewControllerFactory: ViewControllerFactory
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController, viewControllerFactory: ViewControllerFactory) {
        self.navigationController = navigationController
        self.viewControllerFactory = viewControllerFactory
    }
    
    func zTagHistoryViewController(zTagListItem: ZTagListItem) {
        let viewController = viewControllerFactory.zTagHistoryViewController(navigationController: navigationController, zTagListItem: zTagListItem)
        navigationController.pushViewController(viewController, animated: true)
    }
}
