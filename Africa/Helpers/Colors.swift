//
//  Colors.swift
//  ChromeCastProject
//
//  Created by SaiKiran Panuganti on 04/06/21.
//

import UIKit


class Colors {
    static let shared: Colors = Colors()
    
    private init() { }
    
    var splashBackground = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) //rgba(255, 255, 255, 1)
    var orangeAppColor = #colorLiteral(red: 1, green: 0.6862745098, blue: 0, alpha: 1) //rgba(255, 175, 0, 1)
    var tabBarBackrgound = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5) //rgba(0, 0, 0, 0.5)
    
    var menuTopGradientColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.7) //rgba(0, 0, 0, 0.7)
    var menuBottomGradientColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.3) //rgba(0, 0, 0, 0.3)
    var clear = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0) //rgba(0, 0, 0, 0)
    var alertBackground = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5) //rgba(0, 0, 0, 0.5)
    var whiteTextColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) //rgba(255, 255, 255, 1)
    var blackTextColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1) //rgba(0, 0, 0, 1)
    var blackBackgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1) //rgba(0, 0, 0, 1)
    var defaultTextColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) //rgba(255, 255, 255, 1)
    var tabBarTitleUnSelected = #colorLiteral(red: 0.7019607843, green: 0.7019607843, blue: 0.7019607843, alpha: 1) //rgba(179, 179, 179, 1)
    var tabBarTitleSelected = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0) //rgba(255, 255, 255, 1)
    var whiteBackgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) //rgba(255, 255, 255, 1)
    var greyTextColor = #colorLiteral(red: 0.7019607843, green: 0.7019607843, blue: 0.7019607843, alpha: 1) //rgba(179, 179, 179, 1)
    var lightBlueColor = #colorLiteral(red: 0.3098039216, green: 0.6196078431, blue: 0.9490196078, alpha: 1) //rgba(79, 158, 242, 1)
    
    func updateColors(theme: UIUserInterfaceStyle) {
        switch theme {
        case .dark:
            splashBackground = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1) //rgba(0, 0, 0, 1)
            orangeAppColor = #colorLiteral(red: 1, green: 0.6862745098, blue: 0, alpha: 1) //rgba(255, 175, 0, 1)
            tabBarBackrgound = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5) //rgba(0, 0, 0, 0.5)
            
            menuTopGradientColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.7) //rgba(0, 0, 0, 0.7)
            menuBottomGradientColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.3) //rgba(0, 0, 0, 0.3)
            clear = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0) //rgba(0, 0, 0, 0)
            alertBackground = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5) //rgba(0, 0, 0, 0.5)
            whiteTextColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) //rgba(255, 255, 255, 1)
            blackTextColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1) //rgba(0, 0, 0, 1)
            blackBackgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1) //rgba(0, 0, 0, 1)
            defaultTextColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) //rgba(255, 255, 255, 1)
            tabBarTitleUnSelected = #colorLiteral(red: 0.7019607843, green: 0.7019607843, blue: 0.7019607843, alpha: 1) //rgba(179, 179, 179, 1)
            tabBarTitleSelected = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0) //rgba(255, 255, 255, 1)
            whiteBackgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) //rgba(255, 255, 255, 1)
            greyTextColor = #colorLiteral(red: 0.7019607843, green: 0.7019607843, blue: 0.7019607843, alpha: 1) //rgba(179, 179, 179, 1)
            lightBlueColor = #colorLiteral(red: 0.3098039216, green: 0.6196078431, blue: 0.9490196078, alpha: 1) //rgba(79, 158, 242, 1)
        default:
            splashBackground = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) //rgba(255, 255, 255, 1)
            orangeAppColor = #colorLiteral(red: 1, green: 0.6862745098, blue: 0, alpha: 1) //rgba(255, 175, 0, 1)
            tabBarBackrgound = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5) //rgba(0, 0, 0, 0.5)
            
            menuTopGradientColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.7) //rgba(0, 0, 0, 0.7)
            menuBottomGradientColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.3) //rgba(0, 0, 0, 0.3)
            clear = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0) //rgba(0, 0, 0, 0)
            alertBackground = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5) //rgba(0, 0, 0, 0.5)
            whiteTextColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) //rgba(255, 255, 255, 1)
            blackTextColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1) //rgba(0, 0, 0, 1)
            blackBackgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1) //rgba(0, 0, 0, 1)
            defaultTextColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) //rgba(255, 255, 255, 1)
            tabBarTitleUnSelected = #colorLiteral(red: 0.7019607843, green: 0.7019607843, blue: 0.7019607843, alpha: 1) //rgba(179, 179, 179, 1)
            tabBarTitleSelected = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0) //rgba(255, 255, 255, 1)
            whiteBackgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) //rgba(255, 255, 255, 1)
            greyTextColor = #colorLiteral(red: 0.7019607843, green: 0.7019607843, blue: 0.7019607843, alpha: 1) //rgba(179, 179, 179, 1)
            lightBlueColor = #colorLiteral(red: 0.3098039216, green: 0.6196078431, blue: 0.9490196078, alpha: 1) //rgba(79, 158, 242, 1)
        }
    }
}
