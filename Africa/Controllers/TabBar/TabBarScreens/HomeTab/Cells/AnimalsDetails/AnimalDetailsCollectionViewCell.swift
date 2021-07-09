//
//  AnimalDetailsCollectionViewCell.swift
//  Africa
//
//  Created by SaiKiran Panuganti on 04/07/21.
//

import UIKit

protocol AnimalDetailsCollectionViewCellDelegate: AnyObject {
    func animalDetailsTapped(dataSource: AnimalDetailsCollectionViewCellDataSource?)
}

protocol AnimalDetailsCollectionViewCellDataSource {
    var title: String {get}
    var image: String {get}
    var subTitle: String {get}
}

class AnimalDetailsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subTitle: UILabel!
    @IBOutlet weak var nextImage: UIImageView!
    @IBOutlet weak var separator: UIView!

    weak var delegate: AnimalDetailsCollectionViewCellDelegate?
    var dataSource: AnimalDetailsCollectionViewCellDataSource? {
        didSet {
            configureUI()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setUpUI()
    }

    func setUpUI() {
        nextImage.image = UIImage.init(systemName: "chevron.right")?.withRenderingMode(.alwaysTemplate)
        nextImage.tintColor = Colors.shared.greyTintColor
        imageView.layer.cornerRadius = 10.0
        title.font = Fonts.shared.bold5
        subTitle.font = Fonts.shared.regular2
        title.textColor = Colors.shared.orangeAppColor
        separator.backgroundColor = Colors.shared.greyTintColor
    }
    
    func configureUI() {
        imageView.image = UIImage.init(named: dataSource?.image ?? "")
        title.text = dataSource?.title ?? ""
        subTitle.text = dataSource?.subTitle ?? ""
    }
    
    @IBAction func animalDetailsTapped(sender: UIButton) {
        delegate?.animalDetailsTapped(dataSource: dataSource)
    }
}
