//
//  WatchTabView.swift
//  Africa
//
//  Created by SaiKiran Panuganti on 16/07/21.
//

import UIKit

protocol WatchTabViewDataSource {
    var videos: [Video] {get}
}
protocol WatchTabViewDelegate: AnyObject {
    func videoTapped(dataSource: VideoDetailsCollectionViewCellDataSource?)
    func shuffleTapped()
}

class WatchTabView: UIView {
    @IBOutlet weak var collectionView: UICollectionView!
    var navBarView: NavBarView = NavBarView()
    
    var dataSource: WatchTabViewDataSource?
    weak var delegate: WatchTabViewDelegate?
    
    func setUpUI() {
        collectionView.contentInset = UIEdgeInsets(top: 60, left: 0, bottom: 40, right: 0)
        
        collectionView.register(UINib(nibName: "VideoDetailsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "VideoDetailsCollectionViewCell")
        
        collectionView.delegate = self
        collectionView.dataSource = self
        addNavBarView()
    }
    func addNavBarView() {
        navBarView = NavBarView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: topSafeAreaHeight + 44))
        navBarView.delegate = self
        navBarView.backButtonisHidden = true
        
        navBarView.title = "Videos"
        navBarView.leftButtonImage = Images.shared.shuffle
        navBarView.leftSelected = true
        
        self.addSubview(navBarView)
    }
    func updateUI() {
        collectionView.reloadData()
    }
}

extension WatchTabView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource?.videos.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VideoDetailsCollectionViewCell", for: indexPath) as? VideoDetailsCollectionViewCell {
            cell.dataSource = dataSource?.videos[indexPath.row]
            
            if indexPath.row == (dataSource?.videos.count ?? 1) - 1 {
                cell.hideSeparator = true
            }
            
            return cell
        }
        return UICollectionViewCell()
    }
}
extension WatchTabView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: ScreenWidth-40, height: 106)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
extension WatchTabView: UICollectionViewDelegate {
    
}

extension WatchTabView: NavBarViewDelegate {
    func leftButtonTapped() {
        delegate?.shuffleTapped()
    }
}

extension WatchTabView: VideoDetailsCollectionViewCellDelegate {
    func videoTapped(dataSource: VideoDetailsCollectionViewCellDataSource?) {
        delegate?.videoTapped(dataSource: dataSource)
    }
}
