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

extension Animal: ImageTableViewCellDataSource {
    
}

extension Animal: LabelWithUnderlineTableViewCellDataSource {
    var lineColor: UIColor {
        return Colors.shared.orangeAppColor
    }
}

extension Animal: LabelTableViewCellDataSource {
    var text: String? {
        return headline
    }
    var textAlignment: NSTextAlignment {
        return .left
    }
    var textColor: UIColor {
        return Colors.shared.orangeAppColor
    }
    var font: UIFont{
        return Fonts.shared.medium3
    }
}

extension Animal: LabelWithImageTableViewCellDataSource {
    var cellText: String? {
        return Strings.shared.wildernessInPictures
    }
    var cellImage: UIImage? {
        return UIImage(systemName: "photo.on.rectangle.angled")
    }
    var imageTintColor: UIColor {
        return Colors.shared.orangeAppColor
    }
    var cellFont: UIFont {
        return Fonts.shared.medium4
    }
}
