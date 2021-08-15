//
//  AnimalDescriptionViewController.swift
//  Africa
//
//  Created by SaiKiran Panuganti on 14/08/21.
//

import UIKit

class AnimalDescriptionViewController: BaseViewController {
    @IBOutlet weak var animalDescriptionView: AnimalDescriptionView!
    var viewModel: AnimalDescriptionViewModel = AnimalDescriptionViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        animalDescriptionView.delegate = self
        viewModel.delegate = self
        animalDescriptionView.setUpUI()
        viewModel.getData()
    }

    override func recievedNotification(notification: NSNotification?) {
        viewModel.notificationReceived(notfication: notification)
    }
}

extension AnimalDescriptionViewController: AnimalDescriptionViewDelegate {
    func backTapped() {
        viewModel.backTapped()
    }
    func animalWikiTapped(link: String?) {
        viewModel.animalWikiTapped(link: link)
    }
}

extension AnimalDescriptionViewController: AnimalDescriptionViewModelDelegate {
    func updateUI() {
        animalDescriptionView.dataSource = viewModel
        animalDescriptionView.updateUI()
    }
}
