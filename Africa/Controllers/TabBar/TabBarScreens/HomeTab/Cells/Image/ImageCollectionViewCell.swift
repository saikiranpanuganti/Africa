//
//  ImageCollectionViewCell.swift
//  Africa
//
//  Created by SaiKiran Panuganti on 04/07/21.
//

import UIKit

protocol ImageCollectionViewCellDataSource {
    var image: String {get}
}

protocol ImageCollectionViewCellDelegate: AnyObject {
    func imageTapped(dataSource: ImageCollectionViewCellDataSource?)
}

class ImageCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    weak var delegate: ImageCollectionViewCellDelegate?
    var dataSource: ImageCollectionViewCellDataSource? {
        didSet {
            configureUI()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configureUI() {
        imageView.image = UIImage(named: dataSource?.image ?? "")
    }
    
    @IBAction func imageTapped() {
        delegate?.imageTapped(dataSource: dataSource)
    }
}
