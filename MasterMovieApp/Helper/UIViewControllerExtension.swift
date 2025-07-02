//
//  UIViewControllerExtension.swift
//  JSZindigi
//
//  Created by Umar Awais on 17/07/2023.
//

import Foundation
import UIKit
import FittedSheets

extension UIViewController {
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
    
    func screen() -> UIScreen? {
        var parent = self.parent
        var lastParent = parent
        while parent != nil {
            lastParent = parent
            parent = parent!.parent
        }
        return lastParent?.view.window?.windowScene?.screen
    }
}

//MARK: Alerts
extension UIViewController {
    @MainActor
    func showAlert(title: String?, message: String?, icon: AlertIcon, buttonTitle: String = "Okay", showCloseButton: Bool = true, dismissOnTapOutside: Bool = false, animated: Bool = true, showDoneButton: Bool = true, buttonAction: @escaping (() -> Void) = {}) {
        let viewController = Storyboard.main.instantiateViewController(withIdentifier: AlertViewController.storyboardIdentifier) as! AlertViewController
        let sheetController = SheetViewController.getDefaultSheet(viewController: viewController, sizes: [.intrinsic])
        sheetController.dismissOnPull = false
        sheetController.dismissOnOverlayTap = dismissOnTapOutside
        viewController.crossButton.isHidden = !showCloseButton
        viewController.doneButton.isHidden = !showDoneButton
        viewController.alertTitle = title
        viewController.message = message
        viewController.icon = icon
        viewController.buttonTitle = buttonTitle
        viewController.closeAction = {
            sheetController.dismiss(animated: animated)
        }
        viewController.doneAction = {
            sheetController.dismiss(animated: animated) {
                buttonAction()
            }
        }
        self.present(sheetController, animated: animated, completion: nil)
    }
    
    func showAlert(title: String?, message: String?, icon: AlertIcon, buttonTitle: String = "Okay", showCloseButton: Bool = true, dismissOnTapOutside: Bool = false, animated: Bool = true, showDoneButton: Bool = true, buttonAction: @escaping (() -> Void) = {}, closeAction: @escaping (() -> Void) = {}) {
        let viewController = Storyboard.main.instantiateViewController(withIdentifier: AlertViewController.storyboardIdentifier) as! AlertViewController
        let sheetController = SheetViewController.getDefaultSheet(viewController: viewController, sizes: [.intrinsic])
        sheetController.dismissOnPull = false
        sheetController.dismissOnOverlayTap = dismissOnTapOutside
        viewController.alertTitle = title
        viewController.message = message
        viewController.buttonTitle = buttonTitle
        viewController.doneButton.isHidden = !showDoneButton
        viewController.icon = icon
        viewController.crossButton.isHidden = !showCloseButton
        viewController.closeAction = {
            sheetController.dismiss(animated: animated) {
                closeAction()
            }
        }
        viewController.doneAction = {
            sheetController.dismiss(animated: animated) {
                buttonAction()
            }
        }
        self.present(sheetController, animated: animated, completion: nil)
    }
    
    func showAlert(title: String?, attributedMessage: NSAttributedString?, titleAnimation: String, buttonTitle: String = "Okay", showCloseButton: Bool = true, dismissOnTapOutside: Bool = false, showDoneButton: Bool = true, animated: Bool = true, buttonAction: @escaping (() -> Void) = {}, closeAction: @escaping (() -> Void) = {}) {
        let viewController = Storyboard.main.instantiateViewController(withIdentifier: AlertViewController.storyboardIdentifier) as! AlertViewController
        let sheetController = SheetViewController.getDefaultSheet(viewController: viewController, sizes: [.intrinsic])
        sheetController.dismissOnPull = false
        sheetController.dismissOnOverlayTap = dismissOnTapOutside
        viewController.alertTitle = title
        viewController.buttonTitle = buttonTitle
        viewController.attributedMessage = attributedMessage
        viewController.doneButton.isHidden = !showDoneButton
        viewController.titleAnimation = titleAnimation
        viewController.crossButton.isHidden = !showCloseButton
        viewController.closeAction = {
            sheetController.dismiss(animated: animated) {
                closeAction()
            }
        }
        viewController.doneAction = {
            sheetController.dismiss(animated: animated) {
                buttonAction()
            }
        }
        self.present(sheetController, animated: animated, completion: nil)
    }
    
    func showAlert(title: String?, message: String?, titleAnimation: String, buttonTitle: String = "Okay", showCloseButton: Bool = true, dismissOnTapOutside: Bool = false, showDoneButton: Bool = true, animated: Bool = true, buttonAction: @escaping (() -> Void) = {}, closeAction: @escaping (() -> Void) = {}) {
        let viewController = Storyboard.main.instantiateViewController(withIdentifier: AlertViewController.storyboardIdentifier) as! AlertViewController
        let sheetController = SheetViewController.getDefaultSheet(viewController: viewController, sizes: [.intrinsic])
        sheetController.dismissOnPull = false
        sheetController.dismissOnOverlayTap = dismissOnTapOutside
        viewController.alertTitle = title
        viewController.message = message
        viewController.buttonTitle = buttonTitle
        viewController.titleAnimation = titleAnimation
        viewController.crossButton.isHidden = !showCloseButton
        viewController.doneButton.isHidden = !showDoneButton
        viewController.closeAction = {
            sheetController.dismiss(animated: animated) {
                closeAction()
            }
        }
        viewController.doneAction = {
            sheetController.dismiss(animated: animated) {
                buttonAction()
            }
        }
        self.present(sheetController, animated: animated, completion: nil)
    }
    
    func showAlert(title: String?, message: String?, titleAnimation: String, buttonTitle: String = "Okay", showCloseButton: Bool = true, showDoneButton: Bool = true, dismissOnTapOutside: Bool = false, animated: Bool = true, buttonAction: @escaping (() -> Void)) {
        let viewController = Storyboard.main.instantiateViewController(withIdentifier: AlertViewController.storyboardIdentifier) as! AlertViewController
        let sheetController = SheetViewController.getDefaultSheet(viewController: viewController, sizes: [.intrinsic])
        sheetController.dismissOnPull = false
        sheetController.dismissOnOverlayTap = dismissOnTapOutside
        viewController.alertTitle = title
        viewController.message = message
        viewController.titleAnimation = titleAnimation
        viewController.buttonTitle = buttonTitle
        viewController.crossButton.isHidden = !showCloseButton
        viewController.doneButton.isHidden = !showDoneButton
        viewController.closeAction = {
            sheetController.dismiss(animated: animated)
        }
        viewController.doneAction = {
            sheetController.dismiss(animated: animated) {
                buttonAction()
            }
        }
        self.present(sheetController, animated: animated, completion: nil)
    }
        
    func showCancelableAlert(title: String?, message: String?, icon: AlertIcon, showCloseButton: Bool = true, cancelButtonTitle: String?, defaultButtonTitle: String?, cancelButtonStyle: AlertButtonStyle = .secondary, defaultButtonStyle: AlertButtonStyle = .primary,  dismissOnTapOutside: Bool = false, animated: Bool = true, cancelButtonAction: @escaping () -> Void, defaultButtonAction: @escaping () -> Void, closeButtonAction: @escaping (() -> Void) = {} ) {
        
        let viewController = Storyboard.main.instantiateViewController(withIdentifier: DoubleActionAlertViewController.storyboardIdentifier) as! DoubleActionAlertViewController
        let sheetController = SheetViewController.getDefaultSheet(viewController: viewController, sizes: [.intrinsic])
        viewController.alertTitle = title
        sheetController.dismissOnPull = false
        sheetController.dismissOnOverlayTap = dismissOnTapOutside
        viewController.message = message
        viewController.messageLabel.numberOfLines = 0
        viewController.icon = icon
        viewController.crossButton.isHidden = !showCloseButton
        viewController.cancelButtonTitle = cancelButtonTitle
        viewController.defaultButtonTitle = defaultButtonTitle
        viewController.cancelButtonStyle = cancelButtonStyle
        viewController.defaultButtonStyle = defaultButtonStyle
        viewController.cancelButtonAction = {
            sheetController.dismiss(animated: animated) {
                cancelButtonAction()
            }
        }
        viewController.defaultButtonAction = {
            sheetController.dismiss(animated: animated) {
                defaultButtonAction()
            }
        }
        viewController.closeAction = {
            sheetController.dismiss(animated: animated)
            closeButtonAction()
        }
        self.present(sheetController, animated: animated, completion: nil)
    }
    
    func showCancelableAlert(title: String?, message: String?, titleAnimation: String, showCloseButton: Bool = true, cancelButtonTitle: String?, defaultButtonTitle: String?, cancelButtonStyle: AlertButtonStyle = .secondary, defaultButtonStyle: AlertButtonStyle = .primary,  dismissOnTapOutside: Bool = false, animated: Bool = true, cancelButtonAction: @escaping () -> Void, defaultButtonAction: @escaping () -> Void) {
        
        let viewController = Storyboard.main.instantiateViewController(withIdentifier: DoubleActionAlertViewController.storyboardIdentifier) as! DoubleActionAlertViewController
        let sheetController = SheetViewController.getDefaultSheet(viewController: viewController, sizes: [.intrinsic])
        sheetController.dismissOnPull = false
        sheetController.dismissOnOverlayTap = dismissOnTapOutside
        viewController.alertTitle = title
        viewController.message = message
        viewController.titleAnimation = titleAnimation
        viewController.crossButton.isHidden = !showCloseButton
        viewController.cancelButtonTitle = cancelButtonTitle
        viewController.defaultButtonTitle = defaultButtonTitle
        viewController.cancelButtonStyle = cancelButtonStyle
        viewController.defaultButtonStyle = defaultButtonStyle
        viewController.cancelButtonAction = {
            sheetController.dismiss(animated: animated) {
                cancelButtonAction()
            }
        }
        viewController.defaultButtonAction = {
            sheetController.dismiss(animated: animated) {
                defaultButtonAction()
            }
        }
        viewController.closeAction = {
            sheetController.dismiss(animated: animated)
        }
        self.present(sheetController, animated: animated, completion: nil)
    }
    
    func showCancelableAlert(title: String?, attribuitedMessage: NSAttributedString?, icon: AlertIcon, showCloseButton: Bool = true, cancelButtonTitle: String?, defaultButtonTitle: String?, cancelButtonStyle: AlertButtonStyle = .secondary, defaultButtonStyle: AlertButtonStyle = .primary,  dismissOnTapOutside: Bool = false, animated: Bool = true, cancelButtonAction: @escaping () -> Void, defaultButtonAction: @escaping () -> Void, closeButtonAction: @escaping (() -> Void) = {} ) {
        
        let viewController = Storyboard.main.instantiateViewController(withIdentifier: DoubleActionAlertViewController.storyboardIdentifier) as! DoubleActionAlertViewController
        let sheetController = SheetViewController.getDefaultSheet(viewController: viewController, sizes: [.intrinsic])
        viewController.alertTitle = title
        sheetController.dismissOnPull = false
        sheetController.dismissOnOverlayTap = dismissOnTapOutside
        viewController.attributedMessage = attribuitedMessage
        viewController.messageLabel.numberOfLines = 0
        viewController.messageLabel.textAlignment = .center
        viewController.icon = icon
        viewController.crossButton.isHidden = !showCloseButton
        viewController.cancelButtonTitle = cancelButtonTitle
        viewController.defaultButtonTitle = defaultButtonTitle
        viewController.cancelButtonStyle = cancelButtonStyle
        viewController.defaultButtonStyle = defaultButtonStyle
        viewController.cancelButtonAction = {
            sheetController.dismiss(animated: animated) {
                cancelButtonAction()
            }
        }
        viewController.defaultButtonAction = {
            sheetController.dismiss(animated: animated) {
                defaultButtonAction()
            }
        }
        viewController.closeAction = {
            sheetController.dismiss(animated: animated)
            closeButtonAction()
        }
        self.present(sheetController, animated: animated, completion: nil)
    }
    
    func showCancelableAlert(title: String?, attribuitedMessage: NSAttributedString?, titleAnimation: String, showCloseButton: Bool = true, cancelButtonTitle: String?, defaultButtonTitle: String?, cancelButtonStyle: AlertButtonStyle = .secondary, defaultButtonStyle: AlertButtonStyle = .primary,  dismissOnTapOutside: Bool = false, animated: Bool = true, cancelButtonAction: @escaping () -> Void, defaultButtonAction: @escaping () -> Void, closeButtonAction: @escaping (() -> Void) = {} ) {
        
        let viewController = Storyboard.main.instantiateViewController(withIdentifier: DoubleActionAlertViewController.storyboardIdentifier) as! DoubleActionAlertViewController
        let sheetController = SheetViewController.getDefaultSheet(viewController: viewController, sizes: [.intrinsic])
        viewController.alertTitle = title
        sheetController.dismissOnPull = false
        sheetController.dismissOnOverlayTap = dismissOnTapOutside
        viewController.attributedMessage = attribuitedMessage
        viewController.messageLabel.numberOfLines = 0
        viewController.titleAnimation = titleAnimation
        viewController.crossButton.isHidden = !showCloseButton
        viewController.cancelButtonTitle = cancelButtonTitle
        viewController.defaultButtonTitle = defaultButtonTitle
        viewController.cancelButtonStyle = cancelButtonStyle
        viewController.defaultButtonStyle = defaultButtonStyle
        viewController.cancelButtonAction = {
            sheetController.dismiss(animated: animated) {
                cancelButtonAction()
            }
        }
        viewController.defaultButtonAction = {
            sheetController.dismiss(animated: animated) {
                defaultButtonAction()
            }
        }
        viewController.closeAction = {
            sheetController.dismiss(animated: animated)
            closeButtonAction()
        }
        self.present(sheetController, animated: animated, completion: nil)
    }
    
    func showImageViewAlert(title: String?,text: String?, icon: AlertIcon,imagePath: String?, showCloseButton: Bool = true, dismissOnTapOutside: Bool = false, animated: Bool = true) {
        let viewController = Storyboard.main.instantiateViewController(withIdentifier: ImageAlertViewController.storyboardIdentifier) as! ImageAlertViewController
        let sheetController = SheetViewController.getDefaultSheet(viewController: viewController, sizes: [.intrinsic])
        sheetController.dismissOnPull = false
        sheetController.dismissOnOverlayTap = dismissOnTapOutside
        viewController.crossButton.isHidden = !showCloseButton
        viewController.alertTitle = title
        viewController.text = text
        viewController.contentImage = imagePath
        viewController.icon = icon
        viewController.closeAction = {
            sheetController.dismiss(animated: animated)
        }
        self.present(sheetController, animated: animated, completion: nil)
    }
}
