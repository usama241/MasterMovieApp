//
//  AppCoordinator.swift
//  JSZindigi
//
//  Created by Anis Ur Rehman on 14/06/2023.
//

import Foundation
import UIKit
import Lottie
import FittedSheets
import IQKeyboardManagerSwift

class AppCoordinator {
    let window: UIWindow
    let viewControllerFactory: ViewControllerFactoryProtocol
    var navigationController: UINavigationController!
    var homeNavigationController: UINavigationController!
    var promotionNavigationController: UINavigationController!
    var qrNavigationController: UINavigationController!
    //    let cardNavigationController: UINavigationController
    var zspinNavigationController: UINavigationController!
    var moreNavigationController: UINavigationController!
    var tabbarController: TabBarController?
    let eventManager: EventManagerProtocol
    
    init(window: UIWindow, viewControllerFactory: ViewControllerFactoryProtocol, eventManager: EventManagerProtocol) {
        self.eventManager = eventManager
        self.window = window
        self.viewControllerFactory = viewControllerFactory
        appCommonSettings()
        setApplicationUI()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: Notifications.reloadAppNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: Notifications.languageChanged, object: nil)
    }
    
    func start(isUserAvailable: Bool, autoLogin: Bool) {
        if isUserAvailable {
            startLogin(autoLogin: autoLogin)
        } else {
            startOnboarding()
        }
    }
}

// MARK: - Private Functions
extension AppCoordinator {
    fileprivate func appCommonSettings() {
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.keyboardDistanceFromTextField = 30
        SheetViewController.overlayColor = .appOverlayColor
        UIView.appearance().semanticContentAttribute = Language.current.direction
        NotificationCenter.default.addObserver(self, selector: #selector(reloadApp), name: Notifications.reloadAppNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(onLanguageChange), name: Notifications.languageChanged, object: nil)
    }
    
    private func setApplicationUI() {
        setupNavigationControllers()
        setAppDirection()
    }
    
    private func setupNavigationControllers() {
        self.navigationController = UINavigationController()
        self.homeNavigationController = UINavigationController()
        self.promotionNavigationController = UINavigationController()
        self.qrNavigationController = UINavigationController()
        //        self.cardNavigationController = UINavigationController()
        self.zspinNavigationController = UINavigationController()
        self.moreNavigationController = UINavigationController()
        setupNavigationBarUI()
    }
    
    @objc private func reloadApp() {
        setApplicationUI()
        startHome()
    }
    
    @objc private func onLanguageChange() {
        setApplicationUI()
        NotificationCenter.default.post(name: Notifications.reloadScreenNotification, object: nil)
    }
    
    private func setupNavigationBarUI() {
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithTransparentBackground()
        navigationBarAppearance.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor : UIColor.appTextColor,
            NSAttributedString.Key.font: UIFont.titleFont
        ]
        let backButtonInsets = UIEdgeInsets(top: 0, left: 12, bottom: 3, right: 0)
        let image = Language.current.direction == .forceLeftToRight ? UIImage(systemName: "arrow.backward") : UIImage(systemName: "arrow.forward")
        let backImage = image?.imageWithInsets(insets: backButtonInsets)
        navigationBarAppearance.setBackIndicatorImage(backImage, transitionMaskImage: backImage)
        let titleOffsetEn = UIOffset(horizontal: -CGFloat.greatestFiniteMagnitude, vertical: 0)
        let titleOffsetAr = UIOffset(horizontal: +CGFloat.greatestFiniteMagnitude, vertical: 0)
        navigationBarAppearance.titlePositionAdjustment = Language.current.direction == .forceLeftToRight ?  titleOffsetEn : titleOffsetAr
        navigationBarAppearance.backgroundColor = .appBackgroundColor
        UINavigationBar.appearance().tintColor = .appPrimaryColor
        UINavigationBar.appearance().standardAppearance = navigationBarAppearance
        UINavigationBar.appearance().compactAppearance = navigationBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
    }
    
    private func setAppDirection() {
        UIView.appearance().semanticContentAttribute = Language.current.direction
    }
    
    fileprivate func startLogin(autoLogin: Bool) {
        let viewController = viewControllerFactory.loginViewController(navigationController: navigationController, autoLogin: autoLogin)
        navigationController.pushViewController(viewController, animated: false)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    fileprivate func startOnboarding() {
        let viewController = viewControllerFactory.onboardingViewController(navigationController: navigationController) {[weak self] in
            self?.startHome()
        }
        navigationController.pushViewController(viewController, animated: false)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    func startHome() {
        let homeViewController = viewControllerFactory.dashboardViewController(updateCache: true, navigationController: homeNavigationController)
        homeViewController.tabBarItem = UITabBarItem(title: "Home".localized, image: UIImage(named: "homeIcon")!.withRenderingMode(.alwaysTemplate), tag: 0)
        homeViewController.tabBarItem.imageInsets = UIEdgeInsets(top: -5, left: 0, bottom: 5, right: 0)
        let promotionsViewController = viewControllerFactory.homePromotionsViewController(navigationController: promotionNavigationController)
        promotionsViewController.tabBarItem = UITabBarItem(title: "Promotions".localized, image: UIImage(named: "promotionsIcon")!.withRenderingMode(.alwaysTemplate), tag: 1)
        promotionsViewController.tabBarItem.imageInsets = UIEdgeInsets(top: -5, left: 0, bottom: 5, right: 0)
        promotionNavigationController.pushViewController(promotionsViewController, animated: false)
        let qrViewController = viewControllerFactory.qrContainerViewController(navigationController: qrNavigationController)
        qrViewController.tabBarItem = UITabBarItem(title: "Scan QR".localized, image: UIImage(named: "qrIcon"), tag: 2)
        qrViewController.tabBarItem.imageInsets = UIEdgeInsets(top: -5, left: 0, bottom: 5, right: 0)
        qrNavigationController.pushViewController(qrViewController, animated: false)
        
        self.tabbarController = TabBarController(eventManager: eventManager)
        //        let cardsViewController = viewControllerFactory.debitCardTabViewContoller(navigationController: cardNavigationController, tabbarController: tabbarController)
        //        let cardsViewController = viewControllerFactory.virtualCardLandingViewController(navigationController: cardNavigationController)
        //        cardsViewController.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "cardsIcon")!.withRenderingMode(.alwaysTemplate), tag: 3)
        //        cardsViewController.hidesBottomBarWhenPushed = false
        //        cardNavigationController.pushViewController(cardsViewController, animated: false)
        let zspinViewController = viewControllerFactory.zspinTabBarViewController(navigationController: zspinNavigationController)
        zspinViewController.tabBarItem = UITabBarItem(title: "Spin & Win".localized, image: nil, tag: 3)
        zspinViewController.tabBarItem.imageInsets = UIEdgeInsets(top: -5, left: 0, bottom: 5, right: 0)
        zspinViewController.tabBarItem.image = UIImage(named: "Spinandwin_deactive")
        zspinViewController.tabBarItem.selectedImage = UIImage(named: "Spinandwin_active")
        zspinNavigationController.pushViewController(zspinViewController, animated: false)
        
        let moreViewController = viewControllerFactory.moreMenuViewController(navigationController: moreNavigationController)
        moreViewController.tabBarItem = UITabBarItem(title: "More".localized, image: UIImage(named: "moreIcon")!.withRenderingMode(.alwaysTemplate), tag: 4)
        moreViewController.tabBarItem.imageInsets = UIEdgeInsets(top: -5, left: 0, bottom: 5, right: 0)
        
        let viewControllers = [
            homeViewController.navigationController!,
            promotionsViewController.navigationController!,
            qrViewController.navigationController!,
            //            cardsViewController.navigationController!,
            zspinViewController.navigationController!,
            moreViewController.navigationController!
        ]
        
        self.tabbarController?.viewControllers = []
        self.tabbarController?.viewControllers = viewControllers
        if let items = self.tabbarController?.tabBar.items {
            for (index, item) in items.enumerated() {
                switch index {
                case 0:
                    item.title = "Home".localized
                case 1:
                    item.title = "Promotions".localized
                case 2:
                    item.title = "Scan QR".localized
                case 3:
                    item.title = "Spin & Win".localized
                case 4:
                    item.title = "More".localized
                default:
                    break
                }
            }
        }
        window.rootViewController = tabbarController
        window.makeKeyAndVisible()
    }
}
