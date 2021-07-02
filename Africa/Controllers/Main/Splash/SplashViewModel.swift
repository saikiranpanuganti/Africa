//
//  SplashViewModel.swift
//  Africa
//
//  Created by SaiKiran Panuganti on 02/07/21.
//

import Foundation

protocol SplashViewModelDelegate: BaseViewModelDelegate {
    
}

class SplashViewModel : BaseViewModel {
    
    weak var delegate: SplashViewModelDelegate?
    
    func getData() {
        
    }
}

