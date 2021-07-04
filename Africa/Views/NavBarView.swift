//
//  NavBarView.swift
//  Africa
//
//  Created by SaiKiran Panuganti on 03/07/21.
//

import UIKit

class NavBarView: UIView {
    
    var leftButtonImage: String = "" {
        didSet {
            firstButtonImage.isHidden = false
            firstButtonImage.image = UIImage(named: leftButtonImage)
        }
    }
    
    var rightButtonImage: String = "" {
        didSet {
            secondButtonImage.isHidden = false
            secondButtonImage.image = UIImage(named: leftButtonImage)
        }
    }
    
    
    lazy var backView : UIView = {
        let view = UIView()
//        view.backgroundColor = UIColor.red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var backImageView : UIImageView = {
        let backImage = UIImageView()
//        backImage.backgroundColor = UIColor.blue
        backImage.image = UIImage.init(named: Images.shared.back_orange)
        backImage.translatesAutoresizingMaskIntoConstraints = false
        
        return backImage
    }()
    
    lazy var backLabel : UILabel = {
        let label = UILabel()
//        label.backgroundColor = UIColor.blue
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
    
    lazy var buttonsStack : UIStackView = {
        let stackView = UIStackView()
//        stackView.backgroundColor = UIColor.green
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    lazy var firstButtonImage : UIImageView = {
        let backImage = UIImageView()
//        backImage.backgroundColor = UIColor.blue
        backImage.isUserInteractionEnabled = true
        backImage.widthAnchor.constraint(equalToConstant: 25).isActive = true
        backImage.translatesAutoresizingMaskIntoConstraints = false
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(leftButtonTapped(tapGestureRecognizer:)))
        backImage.addGestureRecognizer(tapGestureRecognizer)
        
        return backImage
    }()
    
    lazy var secondButtonImage : UIImageView = {
        let backImage = UIImageView()
//        backImage.backgroundColor = UIColor.blue
        backImage.isUserInteractionEnabled = true
        backImage.widthAnchor.constraint(equalToConstant: 25).isActive = true
        backImage.translatesAutoresizingMaskIntoConstraints = false
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(rightButtonTapped(tapGestureRecognizer:)))
        backImage.addGestureRecognizer(tapGestureRecognizer)
        
        return backImage
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        print("override init(frame: CGRect) called")
        computeValues()
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        print("required init?(coder: NSCoder) called")
        computeValues()
        setUpUI()
    }
    
    func computeValues() {
        
    }
    
    func setUpUI() {
        self.backgroundColor = Colors.shared.tabBarBackrgound
        addSubViews()
        setUpConstraints()
    }
    
    func addSubViews() {
        self.addSubview(backView)
        backView.addSubview(backImageView)
        backView.addSubview(backLabel)
        backView.addSubview(backButton)
        
        buttonsStack.addArrangedSubview(firstButtonImage)
        buttonsStack.addArrangedSubview(secondButtonImage)
        self.addSubview(buttonsStack)
        
        firstButtonImage.isHidden = true
        secondButtonImage.isHidden = true
    }
    
    func setUpConstraints() {
        backView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        backView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: topSafeAreaHeight/2).isActive = true
        backView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        backImageView.leftAnchor.constraint(equalTo: backView.leftAnchor, constant: 10).isActive = true
        backImageView.centerYAnchor.constraint(equalTo: backView.centerYAnchor, constant: 0).isActive = true
        backImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        backImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        backLabel.leftAnchor.constraint(equalTo: backImageView.rightAnchor, constant: 5).isActive = true
        backLabel.centerYAnchor.constraint(equalTo: backView.centerYAnchor, constant: 0).isActive = true
        backLabel.rightAnchor.constraint(equalTo: backView.rightAnchor, constant: -10).isActive = true
        
        backButton.leftAnchor.constraint(equalTo: backView.leftAnchor, constant: 0).isActive = true
        backButton.rightAnchor.constraint(equalTo: backView.rightAnchor, constant: 0).isActive = true
        backButton.centerYAnchor.constraint(equalTo: backView.centerYAnchor, constant: 0).isActive = true
        backButton.heightAnchor.constraint(equalTo: backView.heightAnchor, multiplier: 1.25).isActive = true
        
        buttonsStack.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15).isActive = true
        buttonsStack.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: topSafeAreaHeight/2).isActive = true
        buttonsStack.heightAnchor.constraint(equalToConstant: 25).isActive = true
    }
    
    @objc func backButtonTapped(_ sender: UIButton) {
        print("backButtonTapped")
    }
    
    @objc func leftButtonTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        print("leftButtonTapped")
    }
    
    @objc func rightButtonTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        print("rightButtonTapped")
    }
}
