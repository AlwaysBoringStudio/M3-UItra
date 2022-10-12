//
//  M3_UItraApp.swift
//  M3 UItra
//
//  Created by M2 Ultra on 11/8/2022.
//

import SwiftUI
import UserNotifications

@main
struct M3_UItraApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @State var notifications: [NotifitionValue] = []
    var body: some Scene {
        WindowGroup {
            ContentView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .overlay(alignment: .top) {
                    GeometryReader { proxy in
                        let size = proxy.size
                        
                        ForEach(notifications) { notification in
                            NotificationPreview(size: size,value: notification, notifications: $notifications)
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                            
                        }
                    }
                    .ignoresSafeArea()
                    
                }
                .onReceive(NotificationCenter.default.publisher(for: Notification.Name("NOTIFY"))) { output in
                    if let content = output.userInfo?["content"] as? UNNotificationContent {
                        let newNotification = NotifitionValue(content: content)
                        notifications.append(newNotification)
                    }
                    
                }
        }
    }
}
    

struct NotificationPreview: View {
    var size: CGSize
    var value: NotifitionValue
    @Binding var notifications: [NotifitionValue]
    var body: some View {
        HStack {
            if let image = UIImage(named: "AppIcon60x60") {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 60, height: 60)
                    .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
            }
            VStack(alignment: .leading, spacing: 0) {
                Text(value.content.title)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                Text(value.content.body)
                    .foregroundColor(.white)
            }
            .lineLimit(1)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(10)
        .padding(.horizontal, 12)
        .padding(.vertical, 18)
        .blur(radius: value.showNotification ? 0 : 30)
        .opacity(value.showNotification ? 1 : 0)
        .scaleEffect(value.showNotification ? 1 : 0.5, anchor: .top)
        .frame(width: value.showNotification ? size.width - 22 : 126, height: value.showNotification ? nil : 37.33)
        .background {
            RoundedRectangle(cornerRadius: value.showNotification ? 50 : 63, style: .continuous)
                .fill(.black)
        }
        .offset(y: 11)
        .animation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7), value: value.showNotification)
        .onChange(of: value.showNotification, perform: { newValue in
            if newValue && notifications.indices.contains(index) {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    notifications[index].showNotification = false
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                        notifications.remove(at: index)
                    }
                }
            }
        })
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                notifications[index].showNotification = true
            }
            
            
        }
        
    }
    var index: Int {
        return notifications.firstIndex { CValue in
            CValue.id == value.id
        } ?? 0
    }
}

class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    func application(_ appliction: UIApplication, didFinishLaunchingWithOptions lunchOptions:
        [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        UNUserNotificationCenter.current().delegate = self
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
        }
        UIApplication.shared.registerForRemoteNotifications()
        
        return true
    }
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification) async -> UNNotificationPresentationOptions {
        if UIApplication.shared.supportDynamicIsland {
            
            NotificationCenter.default.post(name: NSNotification.Name("NOTIFY"), object: nil, userInfo: ["content": notification.request.content])
            return [.sound]
        } else {
            return [.sound, .banner]
        }
    }
    private func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) -> String {
        let deviceTokenString = deviceToken.hexString
        print("func here: \(deviceTokenString)")
        return deviceTokenString
    }
    
}

extension UIApplication {
    var supportDynamicIsland: Bool {
        return devicename == "iPhone 14 Pro" || devicename == "iPhone 14 Pro Max"
    }
    var devicename: String {
        return UIDevice.current.name
    }
}

