//
//  WatchViewModel.swift
//  Africa
//
//  Created by SaiKiran Panuganti on 16/07/21.
//

import Foundation

protocol WatchTabViewModelDelegate: BaseViewModelDelegate {
    
}

class WatchTabViewModel: BaseViewModel {
    weak var delegate: WatchTabViewModelDelegate? {
        didSet {
            baseDelegate = delegate
        }
    }
    
    var videos: [Video] = []
    
    override func notificationReceived(notfication: NSNotification?) {
        super.notificationReceived(notfication: notfication)
    }
    
    func getData() {
        videos = Bundle.main.decode("videos.json")
        delegate?.updateUI()
    }
    
    func shuffleTapped() {
        print("shuffleTapped")
    }
    
    func videoTapped(dataSource: VideoDetailsCollectionViewCellDataSource?) {
        print(dataSource?.title ?? "No title")
    }
}

extension WatchTabViewModel: WatchTabViewDataSource {
    
}
