import Foundation
import UIKit

class MovieListCoordinator {
    
    let viewControllerFactory: ViewControllerFactory
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController, viewControllerFactory: ViewControllerFactory) {
        self.navigationController = navigationController
        self.viewControllerFactory = viewControllerFactory
    }
    
    func movieDetailsViewController(selectedMovieId: Int) {
        navigationController.topViewController?.navigationItem.backButtonTitle = ""

        let viewController = viewControllerFactory.movieDetailsViewController(
            navigationController: navigationController,
            selectedMovieId: selectedMovieId
        )
        navigationController.pushViewController(viewController, animated: true)
    }

}
