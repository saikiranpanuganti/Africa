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
    var wilderness: Wilderness?
    var didYouKnow: DidYouknow = DidYouknow()
    var quotes: Quotes?
    var allAbout: AllAbout? = AllAbout()
    var animalDescription: AnimalDescription?
    var learnMore: LearnMore = LearnMore()
    
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
        
        allAbout?.cellText = Strings.shared.allAbout + (animal?.name ?? "")
        
        animalDescription = AnimalDescription(description: animal?.description)
        
        delegate?.updateUI()
    }
    
    func backTapped() {
        delegate?.popTheController()
    }
}

extension DescriptionViewModel: DescriptionViewDataSource {
    
}
