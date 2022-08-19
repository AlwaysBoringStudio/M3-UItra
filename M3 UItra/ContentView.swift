//
//  ContentView.swift
//  M3 UItra
//
//  Created by M2 Ultra on 11/8/2022.
//

import SwiftUI

struct ContentView: View {
    let defaults = UserDefaults.standard
    @State var welcome = false
    
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
        .sheet(isPresented: $welcome) {
            welcomeView(showWelcomeScreen: $welcome)
        }
        
        .onAppear() {
            let hi = defaults.bool(forKey: "firstopen\(UIApplication.appVersion ?? "")")
            if hi == false {
                welcome = true
            }
        }
    }
}


struct Previews_ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



