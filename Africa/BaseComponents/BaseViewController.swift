//
//  BaseViewController.swift
//  ChromeCastProject
//
//  Created by SaiKiran Panuganti on 04/06/21.
//

import UIKit

class BaseViewController: UIViewController {
    var baseViewModel: BaseViewModel = BaseViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(recievedNotification(notification:)), name: .RecievedNotification, object: nil)
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        checkForTheme()
    }
    
    func checkForTheme() {
        if traitCollection.userInterfaceStyle != .unspecified {
            if traitCollection.userInterfaceStyle != Config.shared.theme {
                let theme = traitCollection.userInterfaceStyle
                Config.shared.theme = theme
            }
        }
    }
    
    func push(_ viewController: UIViewController) {
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func pushWoA(_ viewController: UIViewController) {
        navigationController?.pushViewController(viewController, animated: false)
    }
    
    func popTheController() {
        navigationController?.popViewController(animated: true)
    }
    
    func presentVC(_ controller: UIViewController) {
        self.present(controller, animated: true) {
            controller.presentationController?.presentedView?.gestureRecognizers?[0].isEnabled = false
        }
    }
    
    func presentVcWoA(_ controller: UIViewController) {
        self.present(controller, animated: false) {
            controller.presentationController?.presentedView?.gestureRecognizers?[0].isEnabled = false
        }
    }
    
    func getPresentController() -> UIViewController? {
        return self
    }
    
    func popToRoot() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    func getRootViewController() -> UIViewController {
        return navigationController?.parent ?? self
    }
    
    @objc func recievedNotification(notification: NSNotification?) {
        
    }
}
