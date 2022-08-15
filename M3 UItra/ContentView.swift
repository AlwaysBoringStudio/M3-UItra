//
//  ContentView.swift
//  M3 UItra
//
//  Created by M2 Ultra on 11/8/2022.
//

import SwiftUI
import Foundation
import AVFoundation
import Vision
import Combine
import UIKit

struct ContentView: View {
    var body: some View {
        TabView {
            homeView()
                .tabItem {
                    Label("主頁", systemImage: "house")
                }
            practiceView()
                .tabItem {
                    Label("訓練", systemImage: "figure.walk")
                }
            scheduleView()
                .tabItem {
                    Label("日程表", systemImage: "calendar")
                }
            settingsView()
                .tabItem {
                    Label("設定", systemImage: "command.circle")
                }
        }
    }
}


struct circleView: View {
    var systemname: String
    var name: String
    var color: Color
    @State var buttonpressed = false
    var body: some View {
        Button(action: {
            buttonpressed = true
        }, label: {
            Circle()
                .foregroundColor(color)
                .frame(width: 90, height: 90)
                .overlay() {
                    Image(systemName: systemname)
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.black)
                        .padding()
                }
        })
        .sheet(isPresented: $buttonpressed) {
            VStack {
                Circle()
                    .foregroundColor(color)
                    .frame(width: 120, height: 120)
                    .overlay() {
                        Image(systemName: name)
                            .resizable()
                            .scaledToFit()
                            .padding()
                    }
                Text(name)
                    .font(.title)
            }
        }
        
    }
}



struct Previews_ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
