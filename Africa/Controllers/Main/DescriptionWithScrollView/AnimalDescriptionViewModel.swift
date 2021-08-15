//
//  AnimalDescriptionViewModel.swift
//  Africa
//
//  Created by SaiKiran Panuganti on 14/08/21.
//

import UIKit

protocol AnimalDescriptionViewModelDelegate: BaseViewModelDelegate {
    
}

class AnimalDescriptionViewModel: BaseViewModel {
    weak var delegate: AnimalDescriptionViewModelDelegate?
    
    var animal: Animal?
    var wilderness: Wilderness?
    var quotes: Quotes?
    
    func getData() {
        var galleryArray: [Gallery] = []
        let gallery = animal?.gallery
        for image in gallery ?? [] {
            galleryArray.append(Gallery(galleryImage: image))
        }
        wilderness = Wilderness(gallery: galleryArray)
        
        var quotesArray: [Quote] = []
        let facts = animal?.fact
        for fact in facts ?? [] {
            quotesArray.append(Quote(quoteString: fact))
        }
        quotes = Quotes(quotes: quotesArray)
        
        delegate?.updateUI()
    }
    
    func animalWikiTapped(link: String?){
        if let link = link, let url = URL(string: link) {
            UIApplication.shared.open(url)
        }
    }
    func backTapped() {
        delegate?.popTheController()
    }
}

extension AnimalDescriptionViewModel: AnimalDescriptionViewDataSource {
    
}
