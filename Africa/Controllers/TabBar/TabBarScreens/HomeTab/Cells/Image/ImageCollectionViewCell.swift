//
//  ImageCollectionViewCell.swift
//  Africa
//
//  Created by SaiKiran Panuganti on 04/07/21.
//

import UIKit

protocol ImageCollectionViewCellDataSource {
    var coverImage: String? {get}
    var image: String {get}
    var cornerRadius: CGFloat? {get}
}
extension ImageCollectionViewCellDataSource {
    var cornerRadius: CGFloat? {
        get {
            return 0
        }
    }
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
        imageView.image = UIImage(named: (dataSource?.coverImage ?? dataSource?.image) ?? "")
        imageView.layer.cornerRadius = dataSource?.cornerRadius ?? 0
    }
    
    @IBAction func imageTapped() {
        delegate?.imageTapped(dataSource: dataSource)
    }
}
