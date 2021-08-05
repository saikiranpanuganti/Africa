//
//  VideoDetailsCollectionViewCell.swift
//  Africa
//
//  Created by SaiKiran Panuganti on 05/08/21.
//

import UIKit

protocol VideoDetailsCollectionViewCellDelegate: AnyObject {
    func videoTapped(dataSource: VideoDetailsCollectionViewCellDataSource?)
}

protocol VideoDetailsCollectionViewCellDataSource {
    var title: String {get}
    var image: String {get}
    var subTitle: String {get}
}

class VideoDetailsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subTitle: UILabel!
    @IBOutlet weak var nextImage: UIImageView!
    @IBOutlet weak var separator: UIView!
    @IBOutlet weak var playImage: UIImageView!
    
    weak var delegate: VideoDetailsCollectionViewCellDelegate?
    var dataSource: VideoDetailsCollectionViewCellDataSource? {
        didSet {
            configureUI()
        }
    }
    var hideSeparator: Bool = false {
        didSet {
            separator.isHidden = hideSeparator
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setUpUI()
    }
    
    func setUpUI() {
        topView.backgroundColor = Colors.shared.videoBackground
        nextImage.image = UIImage.init(systemName: "chevron.right")?.withRenderingMode(.alwaysTemplate)
        nextImage.tintColor = Colors.shared.greyTintColor
        imageView.layer.cornerRadius = 10.0
        title.font = Fonts.shared.bold5
        subTitle.font = Fonts.shared.regular2
        title.textColor = Colors.shared.orangeAppColor
        separator.backgroundColor = Colors.shared.greyTintColor
        playImage.image = Images.shared.playCircle
        playImage.tintColor = Colors.shared.whiteBlackBackground
    }
    
    func updateTheme() {
        topView.backgroundColor = Colors.shared.videoBackground
        nextImage.tintColor = Colors.shared.greyTintColor
        separator.backgroundColor = Colors.shared.greyTintColor
        playImage.tintColor = Colors.shared.whiteBlackBackground
    }
    
    private func configureUI() {
        imageView.image = UIImage.init(named: dataSource?.image ?? "")
        title.text = dataSource?.title ?? ""
        subTitle.text = dataSource?.subTitle ?? ""
        updateTheme()
    }
    
    @IBAction private func videoTapped(sender: UIButton) {
        delegate?.videoTapped(dataSource: dataSource)
    }
}
