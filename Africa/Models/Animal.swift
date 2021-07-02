//
//  Animal.swift
//  Africa
//
//  Created by SaiKiran Panuganti on 03/07/21.
//

import Foundation

struct Animal: Codable {
  let id: String
  let name: String
  let headline: String
  let description: String
  let link: String
  let image: String
  let gallery: [String]
  let fact: [String]
}
