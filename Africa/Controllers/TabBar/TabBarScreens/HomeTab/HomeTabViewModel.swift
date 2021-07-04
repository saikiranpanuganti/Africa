//
//  HomeTabViewModel.swift
//  Africa
//
//  Created by SaiKiran Panuganti on 04/07/21.
//

import Foundation

protocol HomeTabViewModelDelegate: BaseViewModelDelegate {
    
}

class HomeTabViewModel: BaseViewModel {
    weak var delegate: HomeTabViewModelDelegate?
    
    var animals: [Animal] = []
    
    func getData() {
        animals = Bundle.main.decode("animals.json")
        delegate?.updateUI()
    }
}

extension HomeTabViewModel: HomeTabViewDataSource {
    
}
