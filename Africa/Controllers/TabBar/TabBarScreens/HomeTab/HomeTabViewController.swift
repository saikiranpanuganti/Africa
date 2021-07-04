//
//  HomeTabViewController.swift
//  Africa
//
//  Created by SaiKiran Panuganti on 03/07/21.
//

import UIKit

class HomeTabViewController: UIViewController {

    var navBarView: NavBarView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.blue
        navBarView = NavBarView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: topSafeAreaHeight + 44))
        navBarView.leftButtonImage = Images.shared.logo
//        navBarView.rightButtonImage = Images.shared.back_orange
        self.view.addSubview(navBarView)
    }

}
