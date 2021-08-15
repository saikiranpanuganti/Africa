//
//  AnimalDescriptionView.swift
//  Africa
//
//  Created by SaiKiran Panuganti on 14/08/21.
//

import UIKit

protocol AnimalDescriptionViewDelegate: AnyObject {
    func backTapped()
    func animalWikiTapped(link: String?)
}

protocol AnimalDescriptionViewDataSource: AnyObject {
    var animal: Animal? {get}
    var wilderness: Wilderness? {get}
    var quotes: Quotes? {get}
}

class AnimalDescriptionView: UIView {
    var navBarView: NavBarView = NavBarView()
    
    @IBOutlet weak var animalImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var titleUnderLine: UIView!
    @IBOutlet weak var subtitle: UILabel!
    @IBOutlet weak var wildernessLogo: UIImageView!
    @IBOutlet weak var wildernessLabel: UILabel!
    @IBOutlet weak var didYouKnowImage: UIImageView!
    @IBOutlet weak var didYouKnowLabel: UILabel!
    @IBOutlet weak var allAboutImage: UIImageView!
    @IBOutlet weak var allAboutLabel: UILabel!
    @IBOutlet weak var learnMoreImage: UIImageView!
    @IBOutlet weak var learnMoreLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var wildernessCollectionView: UICollectionView!
    @IBOutlet weak var didYouKnowCollectionView: UICollectionView!
    @IBOutlet weak var globeImage: UIImageView!
    @IBOutlet weak var wikipediaLabel: UILabel!
    @IBOutlet weak var wikiImage: UIImageView!
    @IBOutlet weak var animalWikiLabel: UILabel!
    @IBOutlet weak var wikiView: UIView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    weak var dataSource: AnimalDescriptionViewDataSource?
    weak var delegate: AnimalDescriptionViewDelegate?
    
    func setUpUI() {
        addNavBarView()
        
        wildernessCollectionView.register(UINib(nibName: "ImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ImageCollectionViewCell")
        didYouKnowCollectionView.register(UINib(nibName: "LabelCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "LabelCollectionViewCell")
        
        wildernessCollectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        
        didYouKnowCollectionView.backgroundColor = Colors.shared.quotes
        didYouKnowCollectionView.layer.cornerRadius = 10.0
        
        wildernessCollectionView.delegate = self
        wildernessCollectionView.dataSource = self
        
        didYouKnowCollectionView.delegate = self
        didYouKnowCollectionView.dataSource = self
        
        titleUnderLine.backgroundColor = Colors.shared.orangeAppColor
        title.font = Fonts.shared.heavy11
        subtitle.font = Fonts.shared.medium3
        subtitle.textColor = Colors.shared.orangeAppColor
        wildernessLogo.image = UIImage(systemName: "photo.on.rectangle.angled")?.withRenderingMode(.alwaysTemplate)
        wildernessLogo.tintColor = Colors.shared.orangeAppColor
        wildernessLabel.text = Strings.shared.wildernessInPictures
        wildernessLabel.font = Fonts.shared.medium4
        
        didYouKnowImage.image = UIImage(systemName: "questionmark.circle")?.withRenderingMode(.alwaysTemplate)
        didYouKnowImage.tintColor = Colors.shared.orangeAppColor
        didYouKnowLabel.font = Fonts.shared.medium4
        didYouKnowLabel.text = Strings.shared.didYouKnow
        
        allAboutImage.image = UIImage(systemName: "info.circle")?.withRenderingMode(.alwaysTemplate)
        allAboutImage.tintColor = Colors.shared.orangeAppColor
        allAboutLabel.font = Fonts.shared.medium4
        
        learnMoreImage.image = UIImage(systemName: "books.vertical")?.withRenderingMode(.alwaysTemplate)
        learnMoreImage.tintColor = Colors.shared.orangeAppColor
        learnMoreLabel.font = Fonts.shared.medium4
        learnMoreLabel.text = Strings.shared.learnMore
        
        descriptionLabel.font = Fonts.shared.regular3
        
        globeImage.image = UIImage(systemName: "globe")?.withRenderingMode(.alwaysTemplate)
        globeImage.tintColor = Colors.shared.orangeAppColor
        wikipediaLabel.text = Strings.shared.wikipedia
        wikiImage.image = UIImage(systemName: "arrow.up.right.square")?.withRenderingMode(.alwaysTemplate)
        wikiImage.tintColor = Colors.shared.orangeAppColor
        
        wikiView.backgroundColor = Colors.shared.quotes
    }
    func addNavBarView() {
        navBarView = NavBarView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: topSafeAreaHeight + 44))
        navBarView.delegate = self
        navBarView.backTextColor = Colors.shared.orangeAppColor
        
        self.addSubview(navBarView)
    }
    
    func updateUI() {
        navBarView.title = dataSource?.animal?.name ?? ""
        animalImage.image = UIImage(named: dataSource?.animal?.image ?? "")
        title.text = dataSource?.animal?.title.uppercased()
        subtitle.text = dataSource?.animal?.text
        descriptionLabel.text = dataSource?.animal?.description
        allAboutLabel.text = Strings.shared.allAbout + (dataSource?.animal?.name ?? "")
        wildernessCollectionView.reloadData()
        animalWikiLabel.text = dataSource?.animal?.title
        animalWikiLabel.textColor = Colors.shared.orangeAppColor
        pageControl.numberOfPages = dataSource?.quotes?.quoteArray.count ?? 0
        pageControl.currentPageIndicatorTintColor = Colors.shared.orangeAppColor
    }
    
    @IBAction func wikiTapped(_ sender: UIButton) {
        delegate?.animalWikiTapped(link: dataSource?.animal?.link)
    }
}

extension AnimalDescriptionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == wildernessCollectionView {
            return dataSource?.wilderness?.gallery.count ?? 0
        }else {
            return dataSource?.quotes?.quoteArray.count ?? 0
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == wildernessCollectionView {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as? ImageCollectionViewCell {
                cell.dataSource = dataSource?.wilderness?.gallery[indexPath.row]
                cell.configureUI()
                return cell
            }
        }else {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LabelCollectionViewCell", for: indexPath) as? LabelCollectionViewCell {
                cell.dataSource = dataSource?.quotes?.quoteArray[indexPath.row]
                cell.configureUI()
                return cell
            }
        }
        return UICollectionViewCell()
    }
}

extension AnimalDescriptionView: UICollectionViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
       let visibleRect = CGRect(origin: self.didYouKnowCollectionView.contentOffset, size: self.didYouKnowCollectionView.bounds.size)
       let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
       if let visibleIndexPath = self.didYouKnowCollectionView.indexPathForItem(at: visiblePoint) {
                self.pageControl.currentPage = visibleIndexPath.row
       }
    }
}

extension AnimalDescriptionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == wildernessCollectionView {
            return CGSize(width: ScreenWidth-40, height: (ScreenWidth-40)*0.6)
        }else {
            return CGSize(width: ScreenWidth-20, height: (ScreenWidth-50)*0.6)
        }
    }
}

extension AnimalDescriptionView: NavBarViewDelegate {
    func backButtonTapped() {
        delegate?.backTapped()
    }
}

