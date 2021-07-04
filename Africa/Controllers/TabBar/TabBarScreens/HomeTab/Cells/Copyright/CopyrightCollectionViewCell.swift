//
//  CopyrightCollectionViewCell.swift
//  Africa
//
//  Created by SaiKiran Panuganti on 04/07/21.
//

import UIKit

class CopyrightCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var copyrights: UILabel!
    @IBOutlet weak var rightsReserved: UILabel!
    @IBOutlet weak var betterApps: UILabel!
    @IBOutlet weak var seperator: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setUpUI()
    }

    func setUpUI() {
        imageView.image = UIImage.init(named: Images.shared.compass)?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = Colors.shared.copyrights
        copyrights.text = Strings.shared.copyrights
        copyrights.font = Fonts.shared.regular2
        copyrights.textColor = Colors.shared.copyrights
        rightsReserved.text = Strings.shared.rightsReserved
        rightsReserved.font = Fonts.shared.regular2
        rightsReserved.textColor = Colors.shared.copyrights
        betterApps.text = Strings.shared.betterApps
        betterApps.font = Fonts.shared.regular2
        betterApps.textColor = Colors.shared.copyrights
        seperator.backgroundColor = Colors.shared.greyTintColor
    }
}
