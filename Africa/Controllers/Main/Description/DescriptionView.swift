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
    var wilderness: Wilderness? {get}
    var didYouKnow: DidYouknow {get}
    var quotes: Quotes? {get}
    var allAbout: AllAbout? {get}
    var animalDescription: AnimalDescription? {get}
    var learnMore: LearnMore {get}
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
        descripitionTableView.register(UINib(nibName: "LabelWithUnderlineTableViewCell", bundle: nil), forCellReuseIdentifier: "LabelWithUnderlineTableViewCell")
        descripitionTableView.register(UINib(nibName: "LabelTableViewCell", bundle: nil), forCellReuseIdentifier: "LabelTableViewCell")
        descripitionTableView.register(UINib(nibName: "LabelWithImageTableViewCell", bundle: nil), forCellReuseIdentifier: "LabelWithImageTableViewCell")
        descripitionTableView.register(UINib(nibName: "CollectionTableViewCell", bundle: nil), forCellReuseIdentifier: "CollectionTableViewCell")
        descripitionTableView.register(UINib(nibName: "QuotesTableViewCell", bundle: nil), forCellReuseIdentifier: "QuotesTableViewCell")
    }
    func updateUI() {
        navBarView.title = dataSource?.animal?.name ?? ""
        descripitionTableView.reloadData()
    }
    
}

extension DescriptionView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            if let cell = descripitionTableView.dequeueReusableCell(withIdentifier: "ImageTableViewCell", for: indexPath) as? ImageTableViewCell {
                cell.dataSouce = dataSource?.animal
                cell.configureUI()
                return cell
            }
        }else if indexPath.section == 1 {
            if let cell = descripitionTableView.dequeueReusableCell(withIdentifier: "LabelTableViewCell", for: indexPath) as? LabelTableViewCell {
                cell.dataSource = dataSource?.animal
                cell.configureUI()
                return cell
            }
        }else if indexPath.section == 2 {
            if let cell = descripitionTableView.dequeueReusableCell(withIdentifier: "CollectionTableViewCell", for: indexPath) as? CollectionTableViewCell {
                cell.dataSource = dataSource?.wilderness
                cell.updateUI()
                return cell
            }
        }else if indexPath.section == 3 {
            if let cell = descripitionTableView.dequeueReusableCell(withIdentifier: "QuotesTableViewCell", for: indexPath) as? QuotesTableViewCell {
                cell.dataSource = dataSource?.quotes
                cell.updateUI()
                return cell
            }
        }else if indexPath.section == 4 {
            if let cell = descripitionTableView.dequeueReusableCell(withIdentifier: "LabelTableViewCell", for: indexPath) as? LabelTableViewCell {
                cell.dataSource = dataSource?.animalDescription
                cell.configureUI()
                return cell
            }
        }else if indexPath.section == 5 {
            if let cell = descripitionTableView.dequeueReusableCell(withIdentifier: "LabelTableViewCell", for: indexPath) as? LabelTableViewCell {
                cell.dataSource = dataSource?.animalDescription
                cell.configureUI()
                return cell
            }
        }
        return UITableViewCell()
    }
}

extension DescriptionView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return (ScreenWidth*16)/25
        }else if indexPath.section == 2 {
            return (ScreenWidth-40)*0.6
        }else if indexPath.section == 3 {
            return (ScreenWidth-20)*0.6
        }else {
            return UITableView.automaticDimension
        }
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 1 {
            if let cell = descripitionTableView.dequeueReusableCell(withIdentifier: "LabelWithUnderlineTableViewCell") as? LabelWithUnderlineTableViewCell {
                cell.dataSource = dataSource?.animal
                cell.configureUI()
                return cell
            }
        }else if section == 2 {
            if let cell = descripitionTableView.dequeueReusableCell(withIdentifier: "LabelWithImageTableViewCell") as? LabelWithImageTableViewCell {
                cell.dataSource = dataSource?.animal
                cell.configureUI()
                return cell
            }
        }else if section == 3 {
            if let cell = descripitionTableView.dequeueReusableCell(withIdentifier: "LabelWithImageTableViewCell") as? LabelWithImageTableViewCell {
                cell.dataSource = dataSource?.didYouKnow
                cell.configureUI()
                return cell
            }
        }else if section == 4 {
            if let cell = descripitionTableView.dequeueReusableCell(withIdentifier: "LabelWithImageTableViewCell") as? LabelWithImageTableViewCell {
                cell.dataSource = dataSource?.allAbout
                cell.configureUI()
                return cell
            }
        }else if section == 5 {
            if let cell = descripitionTableView.dequeueReusableCell(withIdentifier: "LabelWithImageTableViewCell") as? LabelWithImageTableViewCell {
                cell.dataSource = dataSource?.learnMore
                cell.configureUI()
                return cell
            }
        }
        return nil
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 1 {
            return 100
        }else if section == 2 || section == 3 || section == 4 || section == 5 {
            return 80
        }else {
            return 0
        }
    }
}

extension DescriptionView: NavBarViewDelegate {
    func backButtonTapped() {
        delegate?.backTapped()
    }
}
