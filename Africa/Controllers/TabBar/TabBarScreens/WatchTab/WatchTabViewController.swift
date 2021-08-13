//
//  WatchTabViewController.swift
//  Africa
//
//  Created by SaiKiran Panuganti on 16/07/21.
//

import UIKit
import AVKit

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
        if let video = dataSource as? Video {
            let path = Bundle.main.path(forResource: video.id, ofType: "mp4")
            let url = URL(fileURLWithPath: path ?? "")
            let player = AVPlayer(url: url)
            let vc = AVPlayerViewController()
            vc.player = player

            present(vc, animated: true) {
                vc.player?.play()
            }
        }
    }
}

extension WatchTabViewController: WatchTabViewModelDelegate {
    func updateUI() {
        watchTabView.dataSource = viewModel
        watchTabView.updateUI()
    }
}
