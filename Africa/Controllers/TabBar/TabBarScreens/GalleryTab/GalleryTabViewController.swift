//
//  GalleryTabViewController.swift
//  Africa
//
//  Created by SaiKiran Panuganti on 15/08/21.
//

import UIKit

class GalleryTabViewController: BaseViewController {
    @IBOutlet weak var galleryTabView: GalleryTabView!
    var viewModel: GalleryTabViewModel = GalleryTabViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        galleryTabView.delegate = self
        viewModel.delegate = self
        viewModel.getData()
        galleryTabView.setUpUI()
    }

    override func recievedNotification(notification: NSNotification?) {
        viewModel.notificationReceived(notfication: notification)
    }
}

extension GalleryTabViewController: GalleryTabViewModelDelegate {
    func updateUI() {
        galleryTabView.dataSource = viewModel
        galleryTabView.updateUI()
    }
}

extension GalleryTabViewController: GalleryTabViewDelegate {
    func animalSelected(animal: Animal?) {
        viewModel.animalSelected(animal: animal)
    }
    
    func showAnimalDetails(animal: Animal?) {
        viewModel.showAnimalDetails(animal: animal)
    }
}
