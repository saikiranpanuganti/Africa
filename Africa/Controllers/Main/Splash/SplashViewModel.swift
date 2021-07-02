//
//  SplashViewModel.swift
//  Africa
//
//  Created by SaiKiran Panuganti on 02/07/21.
//

import Foundation

protocol SplashViewModelDelegate: BaseViewModelDelegate {
    
}

class SplashViewModel : BaseViewModel {
    
    weak var delegate: SplashViewModelDelegate? {
        didSet {
            baseDelegate = delegate
        }
    }
    
    func getData() {
        
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

