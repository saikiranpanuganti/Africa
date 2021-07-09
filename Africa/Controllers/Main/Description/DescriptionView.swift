//
//  DescriptionView.swift
//  Africa
//
//  Created by SaiKiran Panuganti on 09/07/21.
//

protocol DescriptionViewDelegate: AnyObject {
    func backTapped()
}

protocol DescriptionViewDataSource: AnyObject {
    var animal: Animal? {get}
}

import UIKit

class DescriptionView: UIView {
    @IBOutlet weak var descripitionTableView: UITableView!
    var navBarView: NavBarView = NavBarView()
    
    weak var dataSource: DescriptionViewDataSource?
    weak var delegate: DescriptionViewDelegate?
    
    func setUpUI() {
        descripitionTableView.delegate = self
        descripitionTableView.dataSource = self
        addNavBarView()
    }
    
    func addNavBarView() {
        navBarView = NavBarView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: topSafeAreaHeight + 44))
        navBarView.leftButtonImage = Images.shared.squareFillTextGrid1x2
        navBarView.delegate = self
        
        self.addSubview(navBarView)
    }
    
    func updateUI() {
        navBarView.title = dataSource?.animal?.name ?? ""
    }
}

extension DescriptionView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

extension DescriptionView: UITableViewDelegate {
    
}

extension DescriptionView: NavBarViewDelegate {
    func backButtonTapped() {
        delegate?.backTapped()
    }
}
