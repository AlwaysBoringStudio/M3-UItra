//
//  welcomeView.swift
//  M3 UItra
//
//  Created by HingTatTsang on 18/8/2022.
//

import SwiftUI

struct welcomeView: View {
    @Binding var showWelcomeScreen: Bool
    @State var isOnline = false
    var body: some View {
        VStack {
            Spacer()
            Text("歡迎使用")
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            Text("M3-Ultra")
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            Spacer()
            VStack(spacing: 24) {
                
                FeatureCell(image: "figure.walk", title: "訓練", subtitle: "沒有描述", color: .red)
                FeatureCell(image: "calendar", title: "日程表", subtitle: "沒有描述", color: .green)
                FeatureCell(image: "info.circle.fill", title: "Version", subtitle: UIApplication.appVersion ?? "", color: .gray)
                FeatureCell(image: "exclamationmark.triangle.fill", title: "develop in progress", subtitle: "This app is develop in progress.", color: .yellow)
            }
            .padding(.leading)
            
            Spacer()
            Button(action: { self.showWelcomeScreen = false }) {
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




