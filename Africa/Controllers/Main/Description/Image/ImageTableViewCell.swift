//
//  ImageTableViewCell.swift
//  Africa
//
//  Created by SaiKiran Panuganti on 09/07/21.
//

import UIKit

protocol ImageTableViewCellDelegate: AnyObject {
    func imageTapped(dataSource: ImageTableViewCellDataSource?)
}

protocol ImageTableViewCellDataSource {
    var image: String {get}
}

class ImageTableViewCell: UITableViewCell {

    @IBOutlet weak var cellImage: UIImageView!
    
    var dataSouce: ImageTableViewCellDataSource?
    weak var delegate: ImageTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configureUI() {
        if let dataSource = dataSouce {
            cellImage.image = UIImage(named: dataSource.image)
        }
    }
    
    @IBAction func imageTapped(sender: UIButton) {
        delegate?.imageTapped(dataSource: dataSouce)
    }
}
