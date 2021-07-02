//
//  BaseViewModel.swift
//  ChromeCastProject
//
//  Created by SaiKiran Panuganti on 04/06/21.
//

import UIKit

protocol BaseViewModelDelegate: AnyObject {
    func getPresentController() -> UIViewController?
    func updateUI()
    func push(_ viewController: UIViewController)
    func pushWoA(_ viewController: UIViewController)
    func popToRoot()
    func presentVC(_ controller:UIViewController)
    func presentVcWoA(_ controller:UIViewController)
    func popTheController()
    func getRootViewController() -> UIViewController
    var navigationController : UINavigationController? {get}
}

class BaseViewModel {
    weak var baseDelegate: BaseViewModelDelegate?
    
    func notificationReceived(notfication: NSNotification?) {
        if let userInfo = notfication?.object as? [String: Any], let type = userInfo[NotificationCenterAdapter.typeKey] as? NotificationType {
            switch type {
            case .ThemeChanged:
                baseDelegate?.updateUI()
            default:
                break
            }
        }
    }
}
