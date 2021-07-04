//
//  HomeTabView.swift
//  Africa
//
//  Created by SaiKiran Panuganti on 04/07/21.
//

import UIKit

protocol HomeTabViewDataSource: AnyObject {
    var animals: [Animal] {get}
}

class HomeTabView: UIView {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var navBarView: NavBarView = NavBarView()
    
    weak var dataSource: HomeTabViewDataSource?
    
    func setUpUI() {
        addNavBarView()
        registerCells()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func addNavBarView() {
        navBarView = NavBarView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: topSafeAreaHeight + 44))
        
        self.addSubview(navBarView)
    }
    
    func registerCells() {
        collectionView.register(UINib(nibName: "AnimalDetailsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "AnimalDetailsCollectionViewCell")
        collectionView.register(UINib(nibName: "CopyrightCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CopyrightCollectionViewCell")
    }
    
    func updateUI() {
        collectionView.reloadData()
    }
}

extension HomeTabView : UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return dataSource?.animals.count ?? 0
        }
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AnimalDetailsCollectionViewCell", for: indexPath) as? AnimalDetailsCollectionViewCell {
                cell.delegate = self
                cell.dataSource = dataSource?.animals[indexPath.row]
                return cell
            }
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CopyrightCollectionViewCell", for: indexPath)
        return cell
    }
}

extension HomeTabView : UICollectionViewDelegate {
    
}

extension HomeTabView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0{
            return CGSize(width: ScreenWidth, height: 106)
        }
        return CGSize(width: ScreenWidth, height: 228)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension HomeTabView: AnimalDetailsCollectionViewCellDelegate {
    
}
