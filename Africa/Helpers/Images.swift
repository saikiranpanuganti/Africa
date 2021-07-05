//
//  Images.swift
//  ChromeCastProject
//
//  Created by SaiKiran Panuganti on 05/06/21.
//

import UIKit

class Images {
    static let shared: Images = Images()
    
    private init() {
        updateImages(theme: Config.shared.theme)
    }
    
    var compass = "compass"
    var logo = "logo"
    var back_orange = "back_orange"
    
    func updateImages(theme: UIUserInterfaceStyle) {
        switch theme {
        case .dark:
            compass = "compass"
            logo = "logo"
            back_orange = "back_orange"
        default:
            compass = "compass"
            logo = "logo"
            back_orange = "back_orange"
        }
    }
}

