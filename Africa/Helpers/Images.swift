//
//  Images.swift
//  ChromeCastProject
//
//  Created by SaiKiran Panuganti on 05/06/21.
//

import UIKit

class Images {
    static let shared: Images = Images()
    
    private init() { }
    
    var compass = "compass"
    var logo = "logo"
    var netflixGif = "netflixGif"
    var netflixImage = "netflixImage"
    var profileImage1 = "profileImg1"
    var profileImage2 = "profileImg2"
    var profileImage3 = "profileImg3"
    var profileImage4 = "profileImg4"
    var profileImage5 = "profileImg5"
    var comingSoon = "comingSoon"
    var comingSoonUnSelect = "comingSoonUnSelect"
    var download = "download"
    var downloadUnSelect = "downloadUnSelect"
    var home = "home"
    var homeUnSelect = "homeUnSelect"
    var more = "more"
    var moreUnSelect = "moreUnSelect"
    var search = "search"
    var searchUnSelect = "searchUnSelect"
    var netflixLogo = "nLogo"
    var downArrow = "down-arrow"
    var updateAppIcon = "updateAppIcon"
    
    
    func updateImages(theme: UIUserInterfaceStyle) {
        switch theme {
        case .dark:
            compass = "compass"
            logo = "logo"
            netflixGif = "netflixGif"
            netflixImage = "netflixImage"
            profileImage1 = "profileImg1"
            profileImage2 = "profileImg2"
            profileImage3 = "profileImg3"
            profileImage4 = "profileImg4"
            profileImage5 = "profileImg5"
            comingSoon = "comingSoon"
            comingSoonUnSelect = "comingSoonUnSelect"
            download = "download"
            downloadUnSelect = "downloadUnSelect"
            home = "home"
            homeUnSelect = "homeUnSelect"
            more = "more"
            moreUnSelect = "moreUnSelect"
            search = "search"
            searchUnSelect = "searchUnSelect"
            netflixLogo = "nLogo"
            downArrow = "down-arrow"
            updateAppIcon = "updateAppIcon"
        default:
            compass = "compass"
            logo = "logo"
            netflixGif = "netflixGif"
            netflixImage = "netflixImage"
            profileImage1 = "profileImg1"
            profileImage2 = "profileImg2"
            profileImage3 = "profileImg3"
            profileImage4 = "profileImg4"
            profileImage5 = "profileImg5"
            comingSoon = "comingSoon"
            comingSoonUnSelect = "comingSoonUnSelect"
            download = "download"
            downloadUnSelect = "downloadUnSelect"
            home = "home"
            homeUnSelect = "homeUnSelect"
            more = "more"
            moreUnSelect = "moreUnSelect"
            search = "search"
            searchUnSelect = "searchUnSelect"
            netflixLogo = "nLogo"
            downArrow = "down-arrow"
            updateAppIcon = "updateAppIcon"
        }
    }
}

