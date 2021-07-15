//
//  CollectionTableViewCell.swift
//  Africa
//
//  Created by SaiKiran Panuganti on 11/07/21.
//

import UIKit

protocol CollectionTableViewCellDelegate: AnyObject {
    
}

protocol CollectionTableViewCellDataSource {
    var images: [ImageCollectionViewCellDataSource] {get}
}

class CollectionTableViewCell: UITableViewCell {

    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var dataSource: CollectionTableViewCellDataSource?
    weak var delegate: CollectionTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.register(UINib(nibName: "ImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ImageCollectionViewCell")
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
    }
    
    func updateUI() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.reloadData()
    }
}

extension CollectionTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource?.images.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as? ImageCollectionViewCell {
            cell.dataSource = dataSource?.images[indexPath.row]
            cell.configureUI()
            return cell
        }
        return UICollectionViewCell()
    }
}

extension CollectionTableViewCell: UICollectionViewDelegate {
    
}

extension CollectionTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: ScreenWidth-40, height: (ScreenWidth-40)*0.6)
    }
}
