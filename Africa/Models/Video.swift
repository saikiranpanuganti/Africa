//
//  Video.swift
//  Africa
//
//  Created by SaiKiran Panuganti on 03/07/21.
//

import Foundation

struct Video: Codable {
  let id: String
  let name: String
  let headline: String
  
  // Computed Property
  var thumbnail: String {
    "video-\(id)"
  }
}

extension Video: VideoDetailsCollectionViewCellDataSource {
    var title: String {
        return name
    }
    var image: String {
        return thumbnail
    }
    var subTitle: String {
        return headline
    }
}
