//
//  Animal.swift
//  Africa
//
//  Created by SaiKiran Panuganti on 03/07/21.
//

import UIKit

struct Animal: Codable {
    let coverId: Int?
    let coverImage: String?
    let id: String
    let name: String
    let headline: String
    let description: String
    let link: String
    let image: String
    let gallery: [String]
    let fact: [String]
    var cornerRadius: CGFloat? = 0
}

struct Banner {
    let banners: [Animal]
}

extension Animal: AnimalDetailsCollectionViewCellDataSource {
    var title: String {
        return name
    }
    var subTitle: String {
        return headline
    }
}

extension Animal: ImageCollectionViewCellDataSource {
    
}

extension Banner: BannerCollectionViewCellDataSource {
    var title: String {
        return Strings.shared.appName
    }
    
    var bannerItems: [ImageCollectionViewCellDataSource] {
        return banners
    }
}
