//
//  welcomeView.swift
//  M3 UItra
//
//  Created by HingTatTsang on 18/8/2022.
//

import SwiftUI

// MARK: 歡迎頁面

struct welcomeView: View {
    @Binding var showWelcomeScreen: Bool
    @State var isOnline = false
    @ObservedObject private var remoteConnectionManager = RemoteConnectionManager()
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Text("歡迎使用")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                Text("AI教你做運動")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                Spacer()
                VStack(spacing: 24) {
                    FeatureCell(image: "info.circle.fill", title: "Version", subtitle: UIApplication.appVersion ?? "", color: .gray)                  
                    FeatureCell(image: "exclamationmark.triangle.fill", title: "develop in progress", subtitle: "This app is develop in progress.", color: .yellow)
                }
                Spacer()
                let transapp = getdata().getdefaultsdatabool(type: "transapp")
                if transapp == false {
                    Button(
                      action: {
                        remoteConnectionManager.host()
                      }, label: {
                        Rectangle()
                          .frame(width: 350, height: 50)
                          .foregroundColor(.green)
                          .cornerRadius(25)
                          .overlay() {
                            Label("轉移數據到此裝置", systemImage: "square.and.arrow.down.fill")
                          }
                      })
                }
                NavigationLink(
                  destination: RemoteView()
                    .environmentObject(remoteConnectionManager),
                  isActive: $remoteConnectionManager.connectedToRemote) {
                    EmptyView()
                }
                .padding(.leading)
                Spacer()
                Button(action: {
                    getdata().savedefaultsdata(type: "firstopen", data: UIApplication.appVersion ?? "")
                    self.showWelcomeScreen = false
                    getdata().savedefaultsdatabool(type: "transapp", data: true)
                }) {
                    HStack {
                        Spacer()
                        Text("繼續")
                            .font(.headline)
                            .foregroundColor(.white)
                        Spacer()
                    }
                }
                .frame(height: 50)
                .background(Color.blue)
                .cornerRadius(15)
            }
            .padding()
        }
        
    }
    
    
}



struct FeatureCell: View {
    var image: String
    var title: String
    var subtitle: String
    var color: Color
    
    var body: some View {
        HStack(spacing: 24) {
            Image(systemName: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 32)
                .foregroundColor(color)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Text(subtitle)
                    .foregroundColor(.secondary)
                    .font(.subheadline)
            }
            
            Spacer()
        }
    }
}

extension UIApplication {
    static var appVersion: String? {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
    }
}




