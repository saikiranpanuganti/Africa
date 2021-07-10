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
        registerCells()
        descripitionTableView.delegate = self
        descripitionTableView.dataSource = self
        descripitionTableView.contentInset = UIEdgeInsets(top: 44, left: 0, bottom: 0, right: 0)
        addNavBarView()
    }
    func addNavBarView() {
        navBarView = NavBarView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: topSafeAreaHeight + 44))
        navBarView.delegate = self
        navBarView.backTextColor = Colors.shared.orangeAppColor
        
        self.addSubview(navBarView)
    }
    func registerCells() {
        descripitionTableView.register(UINib(nibName: "ImageTableViewCell", bundle: nil), forCellReuseIdentifier: "ImageTableViewCell")
    }
    func updateUI() {
        navBarView.title = dataSource?.animal?.name ?? ""
        descripitionTableView.reloadData()
    }
}

extension DescriptionView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            if let cell = descripitionTableView.dequeueReusableCell(withIdentifier: "ImageTableViewCell", for: indexPath) as? ImageTableViewCell {
                cell.dataSouce = dataSource?.animal
                cell.configureUI()
                return cell
            }
        }
        return UITableViewCell()
    }
}

extension DescriptionView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (ScreenWidth*16)/25
    }
}

extension DescriptionView: NavBarViewDelegate {
    func backButtonTapped() {
        delegate?.backTapped()
    }
}
