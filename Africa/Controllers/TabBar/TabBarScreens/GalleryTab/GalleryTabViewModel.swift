//
//  GalleryTabViewModel.swift
//  Africa
//
//  Created by SaiKiran Panuganti on 15/08/21.
//

import Foundation

protocol GalleryTabViewModelDelegate: BaseViewModelDelegate {
    
}

class GalleryTabViewModel: BaseViewModel {
    weak var delegate: GalleryTabViewModelDelegate? {
        didSet {
            baseDelegate = delegate
        }
    }
    
    var animals: [Animal] = []
    var selectedAnimal: Animal?
    
    override func notificationReceived(notfication: NSNotification?) {
        super.notificationReceived(notfication: notfication)
    }
    
    func getData() {
        animals = Bundle.main.decode("animals.json")
        selectedAnimal = animals[0]
        delegate?.updateUI()
    }
    
    func animalSelected(animal: Animal?) {
        if let animal = animal {
            selectedAnimal = animal
            delegate?.updateUI()
        }
    }
    
    func showAnimalDetails(animal: Animal?) {
        if let animal = animal {
            if let controller = Controller.animalDescription.getViewController() as? AnimalDescriptionViewController {
                controller.viewModel.animal = animal
                delegate?.push(controller)
            }
        }
    }
}

extension GalleryTabViewModel: GalleryTabViewDataSource {
    
}
