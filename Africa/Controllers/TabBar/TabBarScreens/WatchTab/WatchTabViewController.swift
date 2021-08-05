//
//  WatchTabViewController.swift
//  Africa
//
//  Created by SaiKiran Panuganti on 16/07/21.
//

import UIKit

class WatchTabViewController: BaseViewController {
    @IBOutlet weak var watchTabView: WatchTabView!
    var viewModel: WatchTabViewModel = WatchTabViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        watchTabView.delegate = self
        viewModel.delegate = self
        watchTabView.setUpUI()
        viewModel.getData()
    }
    
    override func recievedNotification(notification: NSNotification?) {
        viewModel.notificationReceived(notfication: notification)
    }
}

extension WatchTabViewController: WatchTabViewDelegate {
    func shuffleTapped() {
        viewModel.shuffleTapped()
    }
    func videoTapped(dataSource: VideoDetailsCollectionViewCellDataSource?) {
        viewModel.videoTapped(dataSource: dataSource)
    }
}

extension WatchTabViewController: WatchTabViewModelDelegate {
    func updateUI() {
        watchTabView.dataSource = viewModel
        watchTabView.updateUI()
    }
}
