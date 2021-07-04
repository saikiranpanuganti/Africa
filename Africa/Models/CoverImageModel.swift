//
//  CoverImageModel.swift
//  Africa
//
//  Created by SaiKiran Panuganti on 03/07/21.
//

import Foundation

struct CoverImage: Codable {
  let id: Int
  let name: String
}

struct Banner {
    let banners: [CoverImage]
}

extension CoverImage: ImageCollectionViewCellDataSource {
    var image: String {
        return name
    }
}

extension Banner: BannerCollectionViewCellDataSource {
    var title: String {
        return Strings.shared.appName
    }
    
    var bannerItems: [ImageCollectionViewCellDataSource] {
        return banners
    }
}
