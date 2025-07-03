import Foundation
import UIKit

protocol ViewControllerFactoryProtocol {
    
    init(apiClient: APIClientProtocol)
    func movieListViewController(navigationController: UINavigationController) -> MovieListViewController
    func movieDetailsViewController(navigationController: UINavigationController, selectedMovieId: Int) -> MovieDetailsViewController
}

class ViewControllerFactory: ViewControllerFactoryProtocol {

    private let apiClient: APIClientProtocol
    required init(apiClient: APIClientProtocol) {
        self.apiClient = apiClient
    }
 
    func movieListViewController(navigationController: UINavigationController) -> MovieListViewController {
        let viewController = Storyboard.main.instantiateViewController(identifier: MovieListViewController.storyboardIdentifier) as! MovieListViewController
        let movieServices = MovieServices(apiClient: apiClient)
        viewController.viewModel = MovieListViewModel(service: movieServices)
        viewController.coordinator = MovieListCoordinator(navigationController: navigationController, viewControllerFactory: self)
        return viewController
    }
    
    func movieDetailsViewController(navigationController: UINavigationController, selectedMovieId: Int) -> MovieDetailsViewController {
        let viewController = Storyboard.main.instantiateViewController(identifier: MovieDetailsViewController.storyboardIdentifier) as! MovieDetailsViewController
        let movieServices = MovieServices(apiClient: apiClient)
        viewController.viewModel = MovieDetailsViewModel(service: movieServices, selectedMovieId: selectedMovieId)
        viewController.coordinator = MovieDetailsCoordinator(navigationController: navigationController)
        viewController.title = "Movie Detail"
        return viewController
    }    
}

