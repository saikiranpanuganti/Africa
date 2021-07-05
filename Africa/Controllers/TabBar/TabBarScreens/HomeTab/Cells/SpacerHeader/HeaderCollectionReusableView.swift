//
//  HeaderCollectionReusableView.swift
//  Africa
//
//  Created by SaiKiran Panuganti on 05/07/21.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
    
    @IBOutlet weak var header: UILabel!
    
    var headerTitle : String? {
        didSet {
            configureUI()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpUI()
    }
    
    func setUpUI() {
        header.font = Fonts.shared.heavy10
    }
    
    func configureUI() {
        header.text = headerTitle ?? ""
    }
}
