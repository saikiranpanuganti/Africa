//
//  HomeTabViewController.swift
//  Africa
//
//  Created by SaiKiran Panuganti on 03/07/21.
//

import UIKit

class HomeTabViewController: BaseViewController {
    
    @IBOutlet weak var homeTabView: HomeTabView!
    var viewModel: HomeTabViewModel = HomeTabViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.delegate = self
        homeTabView.setUpUI()
        viewModel.getData()
    }

}

extension HomeTabViewController: HomeTabViewModelDelegate {
    func updateUI() {
        homeTabView.dataSource = viewModel
        homeTabView.updateUI()
    }
}
