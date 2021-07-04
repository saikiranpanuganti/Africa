//
//  TabBarController.swift
//  Africa
//
//  Created by SaiKiran Panuganti on 03/07/21.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBarAppearance()
        setUpTabBar()
    }
    
    func tabBarAppearance() {
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().clipsToBounds = true
        UITabBar.appearance().backgroundColor = Colors.shared.tabBarBackrgound
        UITabBar.appearance().tintColor = Colors.shared.orangeAppColor
    }
    
    func setUpTabBar() {
        let browseController = Controller.homeTab.getViewController()
        browseController.tabBarItem = UITabBarItem(title: Strings.shared.browse, image: UIImage(systemName: "square.grid.2x2"), selectedImage: UIImage(systemName: "square.grid.2x2"))
        
        let watchController = Controller.homeTab.getViewController()
        watchController.tabBarItem = UITabBarItem(title: Strings.shared.watch, image: UIImage(systemName: "play.rectangle"), selectedImage: UIImage(systemName: "play.rectangle"))
        
        let mapController = Controller.homeTab.getViewController()
        mapController.tabBarItem = UITabBarItem(title: Strings.shared.locations, image: UIImage(systemName: "map"), selectedImage: UIImage(systemName: "map"))
        
        let galleryController = Controller.homeTab.getViewController()
        galleryController.tabBarItem = UITabBarItem(title: Strings.shared.gallery, image: UIImage(systemName: "photo"), selectedImage: UIImage(systemName: "photo"))
        
        let controllers = [browseController, watchController, mapController, galleryController]
        
        setViewControllers(controllers, animated: true)
    }

}
