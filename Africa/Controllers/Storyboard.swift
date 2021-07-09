//
//  Storyboard.swift
//  ChromeCastProject
//
//  Created by SaiKiran Panuganti on 12/06/21.
//

import UIKit

enum Controller {
    case splash
    case tabBar
    case homeTabNavigation
    case homeTab
    case description
    
    func getViewController() -> UIViewController {
        
        var storyBoardId = ""
        var controllerId = ""
        
        switch self {
        case .splash:
            storyBoardId = "Main"
            controllerId = "SplashViewController"
        case .tabBar:
            storyBoardId = "TabBar"
            controllerId = "TabBarController"
        case .homeTabNavigation:
            storyBoardId = "TabBar"
            controllerId = "HomeTabNavigationController"
        case .homeTab:
            storyBoardId = "TabBar"
            controllerId = "HomeTabViewController"
        case .description:
            storyBoardId = "Main"
            controllerId = "DescriptionViewController"
        }
        
        let storyboard = UIStoryboard(name: storyBoardId, bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: controllerId)
        return controller
    }
}
