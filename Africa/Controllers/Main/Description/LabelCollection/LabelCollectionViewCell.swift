//
//  LabelCollectionViewCell.swift
//  Africa
//
//  Created by SaiKiran Panuganti on 11/07/21.
//

import UIKit

protocol LabelCollectionViewCellDataSource {
    var text: String? {get}
}

class LabelCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var label: UILabel!
    
    var dataSource: LabelCollectionViewCellDataSource?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configureUI() {
        label.text = dataSource?.text ?? ""
    }

}
