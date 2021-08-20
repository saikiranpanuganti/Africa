//
//  MapsTabViewModel.swift
//  Africa
//
//  Created by SaiKiran Panuganti on 19/08/21.
//

import Foundation

protocol MapsTabViewModelDelegate: BaseViewModelDelegate {
    
}

class MapsTabViewModel: BaseViewModel {
    weak var delegate: MapsTabViewModelDelegate? {
        didSet {
            baseDelegate = delegate
        }
    }
    var locations: [NationalParkLocation] = []
    
    func getData() {
        locations = Bundle.main.decode("locations.json")
        delegate?.updateUI()
    }
}

extension MapsTabViewModel: MapsTabViewDataSource {
    
}
