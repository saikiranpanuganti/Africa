//
//  HomeTabView.swift
//  Africa
//
//  Created by SaiKiran Panuganti on 04/07/21.
//

import UIKit

protocol HomeTabViewDelegate: AnyObject {
    func leftButtonTapped()
    func rightButtonTapped()
}

protocol HomeTabViewDataSource: AnyObject {
    var animals: [Animal] {get}
    var gridAnimals: [Animal] {get}
    var banner: Banner? {get}
    var gridView: Bool {get}
    var gridType: GridType {get}
}

class HomeTabView: UIView {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var navBarView: NavBarView = NavBarView()
    
    weak var dataSource: HomeTabViewDataSource?
    weak var delegate: HomeTabViewDelegate?
    
    func setUpUI() {
        addNavBarView()
        registerCells()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
    func addNavBarView() {
        navBarView = NavBarView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: topSafeAreaHeight + 44))
        navBarView.title = Strings.shared.appName
        navBarView.backButtonisHidden = true
        navBarView.leftButtonImage = Images.shared.squareFillTextGrid1x2
        navBarView.rightButtonImage = Images.shared.squareGrid3x2
        navBarView.delegate = self
        
        self.addSubview(navBarView)
    }
    func registerCells() {
        collectionView.register(UINib(nibName: "AnimalDetailsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "AnimalDetailsCollectionViewCell")
        collectionView.register(UINib(nibName: "CopyrightCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CopyrightCollectionViewCell")
        collectionView.register(UINib(nibName: "BannerCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "BannerCollectionViewCell")
        collectionView.register(UINib(nibName: "ImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ImageCollectionViewCell")
        collectionView.register(UINib(nibName: "HeaderCollectionReusableView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderCollectionReusableView")
    }
    func updateUI() {
        collectionView.reloadData()
        updateNavBar()
    }
    func updateNavBar() {
        if (dataSource?.gridView ?? false) {
            let gridType = dataSource?.gridType ?? .list
            switch gridType {
            case .largeGrid:
                navBarView.rightButtonImage = Images.shared.squareGrid2x2
            case .smallGrid:
                navBarView.rightButtonImage = Images.shared.squareGrid3x2
            default:
                navBarView.rightButtonImage = Images.shared.rectangleGrid1x2
            }
            navBarView.leftSelected = false
        }else {
            navBarView.leftSelected = true
        }
    }
}

extension HomeTabView : UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if (dataSource?.gridView ?? false) {
            return 1
        }
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (dataSource?.gridView ?? false) {
            return dataSource?.gridAnimals.count ?? 0
        }
        if section == 1 {
            return dataSource?.animals.count ?? 0
        }
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (dataSource?.gridView ?? false) {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as? ImageCollectionViewCell {
                cell.delegate = self
                cell.dataSource = dataSource?.gridAnimals[indexPath.row]
                return cell
            }
        }
        if indexPath.section == 0 {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCollectionViewCell", for: indexPath) as? BannerCollectionViewCell {
                cell.delegate = self
                cell.dataSource = dataSource?.banner
                return cell
            }
        }else if indexPath.section == 1 {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AnimalDetailsCollectionViewCell", for: indexPath) as? AnimalDetailsCollectionViewCell {
                cell.delegate = self
                cell.dataSource = dataSource?.animals[indexPath.row]
                return cell
            }
        }else {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CopyrightCollectionViewCell", for: indexPath) as? CopyrightCollectionViewCell {
                cell.configureUI()
                return cell
            }
        }
        return UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if (kind == UICollectionView.elementKindSectionHeader) {
            if let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderCollectionReusableView", for: indexPath) as? HeaderCollectionReusableView {
                headerView.headerTitle = Strings.shared.appName
                
                return headerView
            }
        }
        return UICollectionReusableView()
    }
}

extension HomeTabView : UICollectionViewDelegate {
    
}

extension HomeTabView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if (dataSource?.gridView ?? false) {
            if dataSource?.gridType == .largeGrid {
                return CGSize(width: (ScreenWidth-30)*0.5, height: (ScreenWidth-30)*0.3)
            }else if dataSource?.gridType == .smallGrid {
                return CGSize(width: (ScreenWidth-40)/3, height: (ScreenWidth-40)/4.5)
            }
            return CGSize(width: ScreenWidth-20, height: (ScreenWidth-20)*0.6)
        }
        if indexPath.section == 0{
            return CGSize(width: ScreenWidth-20, height: (ScreenWidth-20)*0.75)
        }else if indexPath.section == 1 {
            return CGSize(width: ScreenWidth-20, height: 106)
        }
        return CGSize(width: ScreenWidth-20, height: 228)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSize(width: ScreenWidth-20, height: 100)
        }
        return CGSize.zero
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if (dataSource?.gridView ?? false) {
            return 10
        }
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if (dataSource?.gridView ?? false) {
            return 10
        }
        return 0
    }
}

extension HomeTabView: AnimalDetailsCollectionViewCellDelegate {
    
}

extension HomeTabView: BannerCollectionViewCellDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > 20.0 {
            navBarView.hideTitle = false
        }else {
            navBarView.hideTitle = true
        }
    }
}

extension HomeTabView: ImageCollectionViewCellDelegate {
    func imageTapped(dataSource: ImageCollectionViewCellDataSource?) {
        
    }
}

extension HomeTabView: NavBarViewDelegate {
    func leftButtonTapped() {
        delegate?.leftButtonTapped()
    }
    func rightButtonTapped() {
        delegate?.rightButtonTapped()
    }
}
