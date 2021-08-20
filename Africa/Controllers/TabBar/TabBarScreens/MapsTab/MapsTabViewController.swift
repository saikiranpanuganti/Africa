//
//  MapsTabViewController.swift
//  Africa
//
//  Created by SaiKiran Panuganti on 19/08/21.
//

import UIKit

class MapsTabViewController: BaseViewController {
    @IBOutlet weak var mapsTabView: MapsTabView!
    var viewModel: MapsTabViewModel = MapsTabViewModel()
        
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.delegate = self
        viewModel.getData()
        mapsTabView.updateUI()
    }
    
}

extension MapsTabViewController: MapsTabViewModelDelegate {
    func updateUI() {
        mapsTabView.dataSource = viewModel
        mapsTabView.updateUI()
    }
}
