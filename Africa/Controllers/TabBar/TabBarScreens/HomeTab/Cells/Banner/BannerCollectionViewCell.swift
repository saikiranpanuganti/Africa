//
//  BannerCollectionViewCell.swift
//  Africa
//
//  Created by SaiKiran Panuganti on 04/07/21.
//

import UIKit

protocol BannerCollectionViewCellDataSource {
    var title: String {get}
    var bannerItems: [ImageCollectionViewCellDataSource] {get}
}

protocol BannerCollectionViewCellDelegate: AnyObject {
    
}

class BannerCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var separator: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    weak var delegate: BannerCollectionViewCellDelegate?
    var dataSource: BannerCollectionViewCellDataSource? {
        didSet {
            configureUI()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.register(UINib(nibName: "ImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ImageCollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        setUpUI()
    }

    func setUpUI() {
        title.font = Fonts.shared.heavy10
    }
    
    func configureUI() {
        title.text = dataSource?.title ?? ""
        pageControl.numberOfPages = dataSource?.bannerItems.count ?? 0
        collectionView.reloadData()
    }
    
    @IBAction func pageControllerAction(_ sender: UIPageControl) {
        print("sender.currentPage ", sender.currentPage)
        self.collectionView.scrollToItem(at: IndexPath(row: sender.currentPage, section: 0), at: .centeredHorizontally, animated: true)
    }
}

extension BannerCollectionViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource?.bannerItems.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as? ImageCollectionViewCell {
            cell.delegate = self
            cell.dataSource = dataSource?.bannerItems[indexPath.row]
            return cell
        }
        return UICollectionViewCell()
    }
}

extension BannerCollectionViewCell: UICollectionViewDelegate{
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
       let visibleRect = CGRect(origin: self.collectionView.contentOffset, size: self.collectionView.bounds.size)
       let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
       if let visibleIndexPath = self.collectionView.indexPathForItem(at: visiblePoint) {
                self.pageControl.currentPage = visibleIndexPath.row
       }
    }
}

extension BannerCollectionViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: ScreenWidth, height: ScreenWidth*0.8)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension BannerCollectionViewCell: ImageCollectionViewCellDelegate {
    func imageTapped(dataSource: ImageCollectionViewCellDataSource?) {
        
    }
}


