//
//  CustomError.swift
//  ChromeCastProject
//
//  Created by SaiKiran Panuganti on 06/06/21.
//

import Foundation

struct CustomError : Error {
    let description : String

    var localizedDescription: String {
        return description
    }
}

