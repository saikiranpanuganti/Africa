//
//  Config.swift
//  ChromeCastProject
//
//  Created by SaiKiran Panuganti on 04/06/21.
//

import UIKit

class Config {
    static var shared: Config = Config()
    
    var theme: UIUserInterfaceStyle = .light {
        didSet {
            if oldValue != theme {
                updateTheme(theme: theme)
            }
        }
    }
    
    private init() {
        
    }

    func updateTheme(theme: UIUserInterfaceStyle) {
        self.theme = theme
        Images.shared.updateImages(theme: theme)
        Colors.shared.updateColors(theme: theme)
        NotificationCenterAdapter.postNotification(info: [NotificationCenterAdapter.eventKey:NotificationType.ThemeChanged.rawValue])
    }
    
}

