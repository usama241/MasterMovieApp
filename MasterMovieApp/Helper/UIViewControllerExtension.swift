import Foundation
import UIKit

extension UIViewController {
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
}
