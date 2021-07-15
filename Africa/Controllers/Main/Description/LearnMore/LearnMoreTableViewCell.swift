//
//  LearnMoreTableViewCell.swift
//  Africa
//
//  Created by SaiKiran Panuganti on 11/07/21.
//

import UIKit

protocol LearnMoreTableViewCellDataSource {
    var animal: String? {get}
}

protocol LearnMoreTableViewCellDelegate: AnyObject {
    
}

class LearnMoreTableViewCell: UITableViewCell {
    @IBOutlet weak var animal: UIButton!
    @IBOutlet weak var globe: UIImageView!
    @IBOutlet weak var wikipedia: UILabel!
    @IBOutlet weak var wikiImage: UIImageView!

    var dataSource: LearnMoreTableViewCellDataSource?
    weak var delegate: LearnMoreTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        globe.image = UIImage(systemName: "globe")
        wikipedia.text = Strings.shared.wikipedia
        wikiImage.image = UIImage(systemName: "arrow.up.right.square")
    }
    
    func configureUI() {
        if let dataSource = dataSource {
            animal.setTitle(dataSource.animal, for: .normal)
            animal.setTitleColor(Colors.shared.orangeAppColor, for: .normal)
        }
    }
    
    @IBAction func animalWikiTapped(_ sender: UIButton) {
        
    }
}
