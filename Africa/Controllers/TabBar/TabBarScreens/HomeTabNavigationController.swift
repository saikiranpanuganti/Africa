//
//  HomeTabNavigationController.swift
//  Africa
//
//  Created by SaiKiran Panuganti on 03/07/21.
//

import UIKit

class HomeTabNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        viewControllers = [Controller.homeTab.getViewController()]
    }
}
