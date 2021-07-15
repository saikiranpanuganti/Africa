//
//  QuotesTableViewCell.swift
//  Africa
//
//  Created by SaiKiran Panuganti on 11/07/21.
//

import UIKit

protocol QuotesTableViewCellDataSource {
    var quoteArray: [LabelCollectionViewCellDataSource] {get}
}

class QuotesTableViewCell: UITableViewCell {
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var dataSource: QuotesTableViewCellDataSource?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.register(UINib(nibName: "LabelCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "LabelCollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        collectionView.backgroundColor = Colors.shared.quotes
        collectionView.layer.cornerRadius = 10.0
    }

    func updateUI() {
        collectionView.reloadData()
        pageControl.numberOfPages = dataSource?.quoteArray.count ?? 0
    }
    
    @IBAction func pageControllerAction(_ sender: UIPageControl) {
        self.collectionView.scrollToItem(at: IndexPath(row: sender.currentPage, section: 0), at: .centeredHorizontally, animated: true)
    }
}

extension QuotesTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource?.quoteArray.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LabelCollectionViewCell", for: indexPath) as? LabelCollectionViewCell {
            cell.dataSource = dataSource?.quoteArray[indexPath.row]
            cell.configureUI()
            return cell
        }
        return UICollectionViewCell()
    }
}

extension QuotesTableViewCell: UICollectionViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
       let visibleRect = CGRect(origin: self.collectionView.contentOffset, size: self.collectionView.bounds.size)
       let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
       if let visibleIndexPath = self.collectionView.indexPathForItem(at: visiblePoint) {
                self.pageControl.currentPage = visibleIndexPath.row
       }
    }
}

extension QuotesTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: ScreenWidth-20, height: (ScreenWidth-50)*0.6)
    }
}

