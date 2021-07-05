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
    weak var delegate: HomeTabViewModelDelegate? {
        didSet {
            baseDelegate = delegate
        }
    }
    
    var animals: [Animal] = []
    var gridAnimals: [Animal] = []
    var banner: Banner?
    var gridView: Bool = false
    var gridType: GridType = .smallGrid
    
    func getData() {
        animals = Bundle.main.decode("animals.json")
        let coverImages: [CoverImage] = Bundle.main.decode("covers.json")
        banner = Banner(banners: coverImages)
        getGridAnimals()
        delegate?.updateUI()
    }
    func getGridAnimals() {
        gridAnimals = animals
        for i in 0..<gridAnimals.count {
            gridAnimals[i].cornerRadius = 10
        }
    }
    
    override func notificationReceived(notfication: NSNotification?) {
        super.notificationReceived(notfication: notfication)
    }
    
    func leftButtonTapped() {
        gridView = false
        delegate?.updateUI()
    }
    func rightButtonTapped() {
        if gridView == false {
            gridView = true
            delegate?.updateUI()
        }else {
            let currentGrid = gridType.rawValue
            if (currentGrid + 1) <= 3 {
                gridType = GridType.init(rawValue: currentGrid+1) ?? .list
            }else {
                gridType = .list
            }
            
            delegate?.updateUI()
        }
    }
}

extension HomeTabViewModel: HomeTabViewDataSource {
    
}
