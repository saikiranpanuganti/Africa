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
    
    var compass = UIImage(named: "compass")
    var copyrightCompass = UIImage(named: "compass")
    var logo = UIImage(named: "logo")
    var back_orange = UIImage(named: "back_orange")
    
    func updateImages(theme: UIUserInterfaceStyle) {
        switch theme {
        case .dark:
            compass = UIImage(named: "compass")
            copyrightCompass = UIImage(named: "compass")
            logo = UIImage(named: "logo")
            back_orange = UIImage(named: "back_orange")
        default:
            compass = UIImage(named: "compass")?.withTintColor(UIColor.black, renderingMode: .alwaysOriginal)
            copyrightCompass = UIImage(named: "compass")
            logo = UIImage(named: "logo")
            back_orange = UIImage(named: "back_orange")
        }
    }
}

