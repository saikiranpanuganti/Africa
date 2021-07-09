//
//  DescriptionViewController.swift
//  Africa
//
//  Created by SaiKiran Panuganti on 09/07/21.
//

import UIKit

class DescriptionViewController: BaseViewController {

    @IBOutlet weak var descriptionView: DescriptionView!
    var viewModel: DescriptionViewModel = DescriptionViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        descriptionView.delegate = self
        viewModel.delegate = self
        descriptionView.setUpUI()
    }

}

extension DescriptionViewController: DescriptionViewDelegate {
    func backTapped() {
        viewModel.backTapped()
    }
    
    
}

extension DescriptionViewController: DescriptionViewModelDelegate {
    func updateUI() {
        
    }
    
    
}
