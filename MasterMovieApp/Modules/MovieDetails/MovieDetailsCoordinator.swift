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
