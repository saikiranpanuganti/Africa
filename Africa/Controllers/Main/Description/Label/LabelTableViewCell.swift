//
//  LabelTableViewCell.swift
//  Africa
//
//  Created by SaiKiran Panuganti on 10/07/21.
//

import UIKit

protocol LabelTableViewCellDataSource {
    var text: String? {get}
    var textAlignment: NSTextAlignment {get}
    var textColor: UIColor {get}
    var font: UIFont {get}
}

extension LabelTableViewCellDataSource {
    var textAlignment: NSTextAlignment {
        get {
            return .center
        }
    }
    var textColor: UIColor {
        get{
            return Colors.shared.blackWhiteBackground
        }
    }
    var font: UIFont {
        get{
            return Fonts.shared.regular3
        }
    }
}

class LabelTableViewCell: UITableViewCell {
    @IBOutlet weak var label: UILabel!
    
    var dataSource: LabelTableViewCellDataSource?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configureUI() {
        if let dataSource = dataSource {
            label.text = dataSource.text
            label.textAlignment = dataSource.textAlignment
            label.textColor = dataSource.textColor
            label.font = dataSource.font
        }
    }
}
