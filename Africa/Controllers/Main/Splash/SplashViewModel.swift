//
//  SplashViewModel.swift
//  Africa
//
//  Created by SaiKiran Panuganti on 02/07/21.
//

import UIKit

protocol SplashViewModelDelegate: BaseViewModelDelegate {
    
}

class SplashViewModel : BaseViewModel {
    
    weak var delegate: SplashViewModelDelegate? {
        didSet {
            baseDelegate = delegate
        }
    }
    
    func getData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.delegate?.navigationController?.viewControllers = [Controller.tabBar.getViewController()]
            strongSelf.delegate?.popToRoot()
        }
    }
    
    
    
    override func notificationReceived(notfication: NSNotification?) {
        super.notificationReceived(notfication: notfication)
        
        if let userInfo = notfication?.object as? [String: Any], let type = userInfo[NotificationCenterAdapter.typeKey] as? NotificationType {
            switch type {
            default:
                break
            }
        }
    }
}

