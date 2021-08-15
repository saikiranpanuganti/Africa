//
//  GalleryTabView.swift
//  Africa
//
//  Created by SaiKiran Panuganti on 15/08/21.
//

import UIKit

protocol GalleryTabViewDelegate: AnyObject {
    func animalSelected(animal: Animal?)
    func showAnimalDetails(animal: Animal?)
}

protocol GalleryTabViewDataSource: AnyObject {
    var animals: [Animal] {get}
    var selectedAnimal: Animal? {get}
}

class GalleryTabView: UIView {
    @IBOutlet weak var collectionView: UICollectionView!
    
    weak var delegate: GalleryTabViewDelegate?
    weak var dataSource: GalleryTabViewDataSource?
    
    var gridType: GridType = .list
    
    func setUpUI() {
        collectionView.register(UINib(nibName: "GalleryImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "GalleryImageCollectionViewCell")
        collectionView.register(UINib(nibName: "GallerySliderCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "GallerySliderCollectionViewCell")
        
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 30, bottom: 20, right: 30)
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func updateUI() {
        collectionView.reloadData()
    }
}

extension GalleryTabView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2 + (dataSource?.animals.count ?? 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GalleryImageCollectionViewCell", for: indexPath) as? GalleryImageCollectionViewCell {
                cell.configureUI(imageString: dataSource?.selectedAnimal?.image ?? "", width: (ScreenWidth-60)*0.8, borderWidth: 8)
                
                return cell
            }
        }else if indexPath.row == 1 {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GallerySliderCollectionViewCell", for: indexPath) as? GallerySliderCollectionViewCell {
                cell.delegate = self
                
                return cell
            }
        }else {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GalleryImageCollectionViewCell", for: indexPath) as? GalleryImageCollectionViewCell {
                if gridType == .smallGrid {
                    cell.configureUI(imageString: dataSource?.animals[indexPath.row - 2].image ?? "", width: (ScreenWidth-90)*0.8/4, borderWidth: 2)
                }else if gridType == .largeGrid {
                    cell.configureUI(imageString: dataSource?.animals[indexPath.row - 2].image ?? "", width: (ScreenWidth-70)*0.8/2, borderWidth: 4)
                }else {
                    cell.configureUI(imageString: dataSource?.animals[indexPath.row - 2].image ?? "", width: (ScreenWidth-80)*0.8/3, borderWidth: 3)
                }
                
                
                return cell
            }
        }
        return UICollectionViewCell()
    }
}

extension GalleryTabView: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            delegate?.showAnimalDetails(animal: dataSource?.selectedAnimal)
            return
        }
        
        if indexPath.row > 1 {
            delegate?.animalSelected(animal: dataSource?.animals[indexPath.row - 2])
        }
    }
}

extension GalleryTabView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 0 {
            return CGSize(width: ScreenWidth-60, height: ScreenWidth-60)
        }else if indexPath.row == 1 {
            return CGSize(width: ScreenWidth-60, height: 50)
        }else {
            if gridType == .smallGrid {
                return CGSize(width: (ScreenWidth-90)/4, height: (ScreenWidth-90)/4)
            }else if gridType == .largeGrid {
                return CGSize(width: (ScreenWidth-70)/2, height: (ScreenWidth-70)/2)
            }else {
                return CGSize(width: (ScreenWidth-80)/3, height: (ScreenWidth-80)/3)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}

extension GalleryTabView: GallerySliderCollectionViewCellDelegate {
    func sliderValueChanged(value: Float) {
        if value == 0 {
            gridType = .largeGrid
        }else if value == 1 {
            gridType = .list
        }else {
            gridType = .smallGrid
        }
        updateUI()
    }
}
