//
//  noifyView.swift
//  M3 UItra
//
//  Created by HingTatTsang on 19/8/2022.
//

import SwiftUI
import UserNotifications

struct notifyView: View {
    let defaults = UserDefaults.standard
    
    @Binding var notifyon: Bool
    
    var body: some View {
        ZStack {
            VStack {
                if notifyon == true {
                    backgroundView()
                }
            }
            List {
                Section {
                    HStack {
                        Toggle(isOn: $notifyon) {
                            Text("允許通知")
                        }
                    }
                }
//                if notifyon == true {
//                    Section {
//                        HStack {
//                            Button("Test") {
//                                let content = UNMutableNotificationContent()
//                                content.title = "Hello !"
//                                content.subtitle = "Test"
//                                content.sound = UNNotificationSound.default
//
//                                // show this notification five seconds from now
//                                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
//
//                                // choose a random identifier
//                                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
//
//                                // add our notification request
//                                UNUserNotificationCenter.current().add(request)
//
//                                print("All set!")
//                            }
//                        }
//                    }
//                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("通知")
        .onDisappear() {
            defaults.set(notifyon, forKey: "notifyon")
            defaults.synchronize()
        }
    }
}

struct backgroundView: View {
    var body: some View {
        Text("")
            .onAppear() {
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        print("All set!")
                    } else if let error = error {
                        print(error.localizedDescription)
                    }
                }
            }
    }
}

struct noifyView_Previews: PreviewProvider {
    static var previews: some View {
        settingsView()
    }
}
