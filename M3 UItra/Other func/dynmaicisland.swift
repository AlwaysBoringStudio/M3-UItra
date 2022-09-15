//
//  dynmaicisland.swift
//  AI教你做運動
//
//  Created by HingTatTsang on 15/9/2022.
//

import SwiftUI
import UserNotifications

struct NotifitionValue: Identifiable {
    var id: String = UUID().uuidString
    var content: UNNotificationContent
    var dateCreated: Date = Date()
    var showNotification: Bool = false
}
