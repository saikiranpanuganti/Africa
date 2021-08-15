//
//  GalleryImageCollectionViewCell.swift
//  Africa
//
//  Created by SaiKiran Panuganti on 15/08/21.
//

import UIKit

class GalleryImageCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var image: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        setUpUI()
    }
    
    func setUpUI() {
        image.layer.masksToBounds = true
    }
    
    func configureUI(imageString: String, width: CGFloat, borderWidth: CGFloat) {
        image.image = UIImage(named: imageString)
        image.layer.cornerRadius = width / 2
        image.layer.borderWidth = borderWidth
        image.layer.borderColor = Colors.shared.blackWhiteBackground.cgColor
    }
}
