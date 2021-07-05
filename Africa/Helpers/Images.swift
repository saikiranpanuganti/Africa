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
    var squareFillTextGrid1x2 = UIImage(systemName: "square.fill.text.grid.1x2")
    var squareGrid2x2 = UIImage(systemName: "square.grid.2x2")
    var squareGrid3x2 = UIImage(systemName: "square.grid.3x2")
    var rectangleGrid1x2 = UIImage(systemName: "rectangle.grid.1x2")
    
    func updateImages(theme: UIUserInterfaceStyle) {
        switch theme {
        case .dark:
            compass = UIImage(named: "compass")
            copyrightCompass = UIImage(named: "compass")
            logo = UIImage(named: "logo")
            back_orange = UIImage(named: "back_orange")
            squareFillTextGrid1x2 = UIImage(systemName: "square.fill.text.grid.1x2")
            squareGrid2x2 = UIImage(systemName: "square.grid.2x2")
            squareGrid3x2 = UIImage(systemName: "square.grid.3x2")
            rectangleGrid1x2 = UIImage(systemName: "rectangle.grid.1x2")
        default:
            compass = UIImage(named: "compass")?.withTintColor(UIColor.black, renderingMode: .alwaysOriginal)
            copyrightCompass = UIImage(named: "compass")
            logo = UIImage(named: "logo")
            back_orange = UIImage(named: "back_orange")
            squareFillTextGrid1x2 = UIImage(systemName: "square.fill.text.grid.1x2")
            squareGrid2x2 = UIImage(systemName: "square.grid.2x2")
            squareGrid3x2 = UIImage(systemName: "square.grid.3x2")
            rectangleGrid1x2 = UIImage(systemName: "rectangle.grid.1x2")
        }
    }
}

