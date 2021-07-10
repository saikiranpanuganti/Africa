//
//  DescriptionViewModel.swift
//  Africa
//
//  Created by SaiKiran Panuganti on 09/07/21.
//

import Foundation

protocol DescriptionViewModelDelegate: BaseViewModelDelegate {
    
}

class DescriptionViewModel: BaseViewModel {
    weak var delegate: DescriptionViewModelDelegate?
    
    var animal: Animal?
    
    func getData() {
        delegate?.updateUI()
    }
    
    func backTapped() {
        delegate?.popTheController()
    }
}

extension DescriptionViewModel: DescriptionViewDataSource {
    
}
