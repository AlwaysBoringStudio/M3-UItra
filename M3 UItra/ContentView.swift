//
//  ContentView.swift
//  M3 UItra
//
//  Created by M2 Ultra on 11/8/2022.
//

import SwiftUI
import Foundation

// MARK: 分頁控制器
struct ContentView: View {
    @State var welcome = false
    @State var refresh = true
    @State private var selection = 1
    var body: some View {
        ZStack {
            TabView(selection: $selection) {
                Group {
                    if refresh == true {
                        refreshhelper(refresh: $refresh)
                    } else {
                        homeView()
                    }
                }
                    .tabItem {
                        Label("主頁", systemImage: "house")
                    }
                    .tag(1)
                practiceView()
                    .tabItem {
                        Label("訓練", systemImage: "figure.walk")
                    }
                    .tag(2)
                scheduleView(refresh: $refresh)
                    .tabItem {
                        Label("日程表", systemImage: "calendar")
                    }
                    .tag(3)
                settingsView(refresh: $refresh)
                    .tabItem {
                        Label("設定", systemImage: "command.circle")
                    }
                    .tag(4)
                
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
            
    }
}


// MARK: 重新整理
struct refreshhelper: View {
    let defaults = UserDefaults.standard
    @State var alldatakey = ["ismoved"]
    @State var alldatastring = ["ismoved"]
    @Binding var refresh: Bool
    var body: some View {
        Text("refreshing")
        
        .onAppear() {
            refresh = false
        }
        
    }

}

struct Previews_ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



