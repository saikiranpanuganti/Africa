//
//  NavBarView.swift
//  Africa
//
//  Created by SaiKiran Panuganti on 03/07/21.
//

import UIKit

class NavBarView: UIView {
    var tvLeftAnchor = NSLayoutConstraint()
    
    lazy var backImageView : UIImageView = {
        let backImage = UIImageView()
        backImage.image = UIImage.init(named: Images.shared.back_orange)
        backImage.translatesAutoresizingMaskIntoConstraints = false
        
        return backImage
    }()
    
    lazy var backLabel : UILabel = {
        let label = UILabel()
        label.text = Strings.shared.back
        label.font = UIFont.systemFont(ofSize: 16)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var backButton : UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(backButtonTapped(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        self.backgroundColor = Colors.shared.clear
        setUpUI()
        setUpConstraints()
    }
    
    func setUpUI() {
        self.addSubview(backImageView)
        self.addSubview(backLabel)
        self.addSubview(backButton)
    }
    
    func setUpConstraints() {
        backImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        backImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        backImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        backImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        backLabel.leftAnchor.constraint(equalTo: backImageView.rightAnchor, constant: 10).isActive = true
        backLabel.centerYAnchor.constraint(equalTo: backImageView.centerYAnchor, constant: 0).isActive = true
        
        backButton.leftAnchor.constraint(equalTo: backImageView.leftAnchor, constant: 0).isActive = true
        backButton.rightAnchor.constraint(equalTo: backLabel.rightAnchor, constant: 0).isActive = true
        backButton.centerYAnchor.constraint(equalTo: backButton.centerYAnchor, constant: 0).isActive = true
        backButton.heightAnchor.constraint(equalTo: backImageView.heightAnchor, multiplier: 1.25).isActive = true
    }
    
    @objc func backButtonTapped(_ sender: UIButton) {
        print("backButtonTapped")
    }
}
