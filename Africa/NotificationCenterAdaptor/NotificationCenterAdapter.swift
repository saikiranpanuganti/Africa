//
//  NotificationCenterAdapter.swift
//  Africa
//
//  Created by SaiKiran Panuganti on 02/07/21.
//

import Foundation

extension Notification.Name {
    static let RecievedNotification = Notification.Name("RecievedNotification")
}

enum NotificationType: String {
    case ThemeChanged = "ThemeChanged"
    case Unknown = "Unknown"
}

class NotificationCenterAdapter {
    
    static let typeKey = "notificationType"
    static let eventKey = "event"
    
    static func postNotification(info: [String:Any]) {
        var info = info
        info[typeKey] = NotificationType.init(rawValue: info[eventKey] as? String ?? "") ?? NotificationType.Unknown
        NotificationCenter.default.post(name: .RecievedNotification, object: info)
    }
}
