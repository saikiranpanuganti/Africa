//
//  LabelWithImageTableViewCell.swift
//  Africa
//
//  Created by SaiKiran Panuganti on 10/07/21.
//

import UIKit

protocol LabelWithImageTableViewCellDataSource {
    var cellImage: UIImage? {get}
    var cellText: String? {get}
    var imageTintColor: UIColor {get}
    var cellFont: UIFont {get}
}

extension LabelWithImageTableViewCellDataSource {
    var imageTintColor: UIColor {
        get{
            return UIColor.clear
        }
    }
    var cellFont: UIFont {
        get {
            return Fonts.shared.regular4
        }
    }
}

class LabelWithImageTableViewCell: UITableViewCell {
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellText: UILabel!
    
    var dataSource: LabelWithImageTableViewCellDataSource?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func configureUI() {
        if let dataSource = dataSource {
            cellImage.image = dataSource.cellImage?.withRenderingMode(.alwaysTemplate)
            cellImage.tintColor = dataSource.imageTintColor
            cellText.text = dataSource.cellText
            cellText.font = dataSource.cellFont
        }
    }
}
