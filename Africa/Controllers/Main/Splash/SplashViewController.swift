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

        checkForTheme()
        splashView.setUpUI()
        viewModel.getData()
        viewModel.delegate = self
    }

    func checkForTheme() {
         if traitCollection.userInterfaceStyle == .dark {
            Config.shared.theme = .dark
        }else {
            Config.shared.theme = .light
        }
    }
}

extension SplashViewController: SplashViewModelDelegate {
    func updateUI() {
        //Nothing to update
    }
}
