//
//  HomeTabViewController.swift
//  Africa
//
//  Created by SaiKiran Panuganti on 03/07/21.
//

import UIKit

class HomeTabViewController: UIViewController {

    weak var navBarView: NavBarView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.blue
        let navBarView = NavBarView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: topSafeAreaHeight + 44))
        self.view.addSubview(navBarView)
    }

}
