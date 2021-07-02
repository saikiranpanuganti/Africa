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
        
        if Config.shared.theme == .dark {
            imageView.image = UIImage.init(named: Images.shared.compass)
        }else {
            imageView.image = UIImage.init(named: Images.shared.compass)?.withTintColor(UIColor.black, renderingMode: .alwaysOriginal)
        }
    }
    
    func updateUI() {
        setUpUI()
    }
}
