//
//  SplashViewController.swift
//  Africa
//
//  Created by SaiKiran Panuganti on 02/07/21.
//

import UIKit

class SplashViewController: BaseViewController {
    
    @IBOutlet weak var splashView: SplashView!
    var viewModel: SplashViewModel = SplashViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.delegate = self
        checkForTheme()
        splashView.setUpUI()
        viewModel.getData()
    }
    
    override func recievedNotification(notification: NSNotification?) {
        viewModel.notificationReceived(notfication: notification)
    }
}

extension SplashViewController: SplashViewModelDelegate {
    func updateUI() {
        splashView.updateUI()
    }
}
