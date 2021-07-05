//
//  SplashView.swift
//  Africa
//
//  Created by SaiKiran Panuganti on 02/07/21.
//

import UIKit

class SplashView: UIView {
    
    @IBOutlet weak var imageView: UIImageView!
    
    func setUpUI() {
        self.backgroundColor = Colors.shared.splashBackground
        
        imageView.image = Images.shared.compass
    }
    
    func updateUI() {
        setUpUI()
    }
}
