//
//  LabelWithUnderlineTableViewCell.swift
//  Africa
//
//  Created by SaiKiran Panuganti on 10/07/21.
//

import UIKit

protocol LabelWithUnderlineTableViewCellDataSource  {
    var backGroundColor: UIColor {get}
    var title: String {get}
    var lineColor: UIColor {get}
}

extension LabelWithUnderlineTableViewCellDataSource  {
    var backGroundColor: UIColor {
        get {
            return Colors.shared.whiteBlackBackground
        }
    }
    var lineColor: UIColor {
        get{
            return Colors.shared.orangeAppColor
        }
    }
}

protocol LabelWithUnderlineTableViewCellDelegate: AnyObject {
    
}

class LabelWithUnderlineTableViewCell: UITableViewCell {

    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var line: UIView!
    
    var dataSource: LabelWithUnderlineTableViewCellDataSource?
    weak var delegate: LabelWithUnderlineTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.font = Fonts.shared.heavy11
    }

    func configureUI() {
        if let dataSource = dataSource {
            titleLabel.text = dataSource.title.uppercased()
            topView.backgroundColor = dataSource.backGroundColor
            line.backgroundColor = dataSource.lineColor
        }
    }
}
