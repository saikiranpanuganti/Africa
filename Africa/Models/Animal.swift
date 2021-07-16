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

struct Wilderness {
    let gallery: [Gallery]
}

struct Gallery {
    let galleryImage: String
}

extension Wilderness: CollectionTableViewCellDataSource {
    var images: [ImageCollectionViewCellDataSource] {
        return gallery
    }
}

extension Gallery: ImageCollectionViewCellDataSource {
    var coverImage: String? {
        galleryImage
    }
    var image: String {
        return ""
    }
    var cornerRadius: CGFloat? {
        return 10.0
    }
}

struct Quotes {
    let quotes: [Quote]
}

struct Quote {
    let quoteString: String
}

extension Quotes: QuotesTableViewCellDataSource {
    var quoteArray: [LabelCollectionViewCellDataSource] {
        return quotes
    }
}

extension Quote: LabelCollectionViewCellDataSource {
    var text: String? {
        return quoteString
    }
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

struct DidYouknow {
    let cellImage: UIImage? = UIImage(systemName: "questionmark.circle")
    let cellText: String? = Strings.shared.didYouKnow
    var imageTintColor: UIColor = Colors.shared.orangeAppColor
    var cellFont: UIFont = Fonts.shared.medium4
}
extension DidYouknow: LabelWithImageTableViewCellDataSource {
    
}

struct AllAbout {
    let cellImage: UIImage? = UIImage(systemName: "info.circle")
    var cellText: String? = ""
    var imageTintColor: UIColor = Colors.shared.orangeAppColor
    var cellFont: UIFont = Fonts.shared.medium4
}
extension AllAbout: LabelWithImageTableViewCellDataSource {
    
}

struct AnimalDescription {
    var description: String?
}
extension AnimalDescription: LabelTableViewCellDataSource {
    var text: String? {
        return description
    }
    var textAlignment: NSTextAlignment {
        return .left
    }
}

struct LearnMore {
    let cellImage: UIImage? = UIImage(systemName: "books.vertical")
    let cellText: String? = Strings.shared.learnMore
    var imageTintColor: UIColor = Colors.shared.orangeAppColor
    var cellFont: UIFont = Fonts.shared.medium4
}
extension LearnMore: LabelWithImageTableViewCellDataSource {
    
}

struct AnimalWiki {
    var animal: String?
    var link: String?
}

extension AnimalWiki: LearnMoreTableViewCellDataSource {
    
}
