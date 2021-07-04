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
    var banner: Banner?
    
    func getData() {
        animals = Bundle.main.decode("animals.json")
        let coverImages: [CoverImage] = Bundle.main.decode("covers.json")
        banner = Banner(banners: coverImages)
        delegate?.updateUI()
    }
}

extension HomeTabViewModel: HomeTabViewDataSource {
    
}
