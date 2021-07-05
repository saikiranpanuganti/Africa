//
//  NavBarView.swift
//  Africa
//
//  Created by SaiKiran Panuganti on 03/07/21.
//

import UIKit

protocol NavBarViewDelegate: AnyObject {
    func backButtonTapped()
    func leftButtonTapped()
    func rightButtonTapped()
}

extension NavBarViewDelegate {
    func backButtonTapped() { }
    func leftButtonTapped() { }
    func rightButtonTapped() { }
}

class NavBarView: UIView {
    weak var delegate: NavBarViewDelegate?
    
    var leftButtonImage: UIImage? {
        didSet {
            firstButtonImage.isHidden = false
            firstButtonImage.image = leftButtonImage?.withRenderingMode(.alwaysTemplate)
        }
    }
    
    var rightButtonImage: UIImage? {
        didSet {
            secondButtonImage.isHidden = false
            secondButtonImage.image = rightButtonImage?.withRenderingMode(.alwaysTemplate)
        }
    }
    
    var backButtonisHidden: Bool = false {
        didSet {
            backView.isHidden = true
        }
    }
    
    var title: String = "" {
        didSet {
            titleLabel.text = title
        }
    }
    
    var hideTitle: Bool = true {
        didSet {
            titleLabel.isHidden = hideTitle
        }
    }
    
    var leftSelected: Bool = true {
        didSet {
            updateButtons()
        }
    }
    
    private lazy var backView : UIView = {
        let view = UIView()
//        view.backgroundColor = UIColor.red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var backImageView : UIImageView = {
        let backImage = UIImageView()
//        backImage.backgroundColor = UIColor.blue
        backImage.image = Images.shared.back_orange
        backImage.translatesAutoresizingMaskIntoConstraints = false
        
        return backImage
    }()
    
    private lazy var backLabel : UILabel = {
        let label = UILabel()
//        label.backgroundColor = UIColor.blue
        label.text = Strings.shared.back
        label.font = Fonts.shared.regular3
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var backButton : UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(backButtonTapped(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private lazy var buttonsStack : UIStackView = {
        let stackView = UIStackView()
//        stackView.backgroundColor = UIColor.green
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private lazy var firstButtonImage : UIImageView = {
        let imageView = UIImageView()
//        imageView.backgroundColor = UIColor.blue
        imageView.isUserInteractionEnabled = true
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = Colors.shared.orangeAppColor
        imageView.widthAnchor.constraint(equalToConstant: 35).isActive = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(leftButtonTapped(tapGestureRecognizer:)))
        imageView.addGestureRecognizer(tapGestureRecognizer)
        
        return imageView
    }()
    
    private lazy var secondButtonImage : UIImageView = {
        let imageView = UIImageView()
//        imageView.backgroundColor = UIColor.blue
        imageView.isUserInteractionEnabled = true
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = Colors.shared.blackWhiteBackground
        imageView.widthAnchor.constraint(equalToConstant: 35).isActive = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(rightButtonTapped(tapGestureRecognizer:)))
        imageView.addGestureRecognizer(tapGestureRecognizer)
        
        return imageView
    }()
    
    private lazy var titleLabel : UILabel = {
        let label = UILabel()
//        label.backgroundColor = UIColor.blue
        label.font = Fonts.shared.bold3
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
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
    
    private func computeValues() {
        
    }
    
    private func setUpUI() {
        updateTheme()
        addSubViews()
        setUpConstraints()
        NotificationCenter.default.addObserver(self, selector: #selector(recievedNotification(notification:)), name: .RecievedNotification, object: nil)
    }
    
    private func addSubViews() {
        self.addSubview(backView)
        backView.addSubview(backImageView)
        backView.addSubview(backLabel)
        backView.addSubview(backButton)
        
        buttonsStack.addArrangedSubview(firstButtonImage)
        buttonsStack.addArrangedSubview(secondButtonImage)
        self.addSubview(buttonsStack)
        
        firstButtonImage.isHidden = true
        secondButtonImage.isHidden = true
        
        self.addSubview(titleLabel)
        titleLabel.isHidden = true
    }
    
    private func setUpConstraints() {
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
        
        titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: topSafeAreaHeight/2).isActive = true
    }
    
    private func updateButtons() {
        if leftSelected {
            firstButtonImage.tintColor = Colors.shared.orangeAppColor
            secondButtonImage.tintColor = Colors.shared.blackWhiteBackground
        }else {
            firstButtonImage.tintColor = Colors.shared.blackWhiteBackground
            secondButtonImage.tintColor = Colors.shared.orangeAppColor
        }
    }
    
    private func updateTheme() {
        self.backgroundColor = Colors.shared.tabBarBackrgound
        updateButtons()
    }
    
    @objc private func recievedNotification(notification: NSNotification?) {
        if let userInfo = notification?.object as? [String: Any], let type = userInfo[NotificationCenterAdapter.typeKey] as? NotificationType {
            switch type {
            case .ThemeChanged:
                updateTheme()
            default:
                break
            }
        }
    }
    
    @objc private func backButtonTapped(_ sender: UIButton) {
        delegate?.rightButtonTapped()
    }
    
    @objc private func leftButtonTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        delegate?.leftButtonTapped()
    }
    
    @objc private func rightButtonTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        delegate?.rightButtonTapped()
    }
}
