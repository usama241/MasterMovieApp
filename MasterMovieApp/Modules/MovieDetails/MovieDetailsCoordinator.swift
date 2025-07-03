//
//  MovieDetailsCoordinator.swift
//  MasterMovieApp
//
//  Created by MacBook Pro on 01/07/2025.
//

import Foundation
import UIKit

class MovieDetailsCoordinator {
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func gotoBack() {
        self.navigationController.popViewController(animated: true)
    }
}
