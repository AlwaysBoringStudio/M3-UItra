//
//  airplaysettingsView.swift
//  M3 UItra
//
//  Created by HingTatTsang on 19/8/2022.
//

import SwiftUI

struct airplaysettingsView: View {
    @ObservedObject var externalDisplayContent = ExternalDisplayContent()
    let defaults = UserDefaults.standard
    @State var airplay = true
    @State var quit = false
    var body: some View {
        List {
            Section {
                HStack {
                    Toggle(isOn: $airplay) {
                        Text("使用 AirPlay 顯示詳細資訊")
                    }
                }
            }
            Section {
                Button(action: {
                    quit = true
                }, label: {
                    HStack {
                        Spacer()
                        Text("重新啟動應用程式, 使此設定生效")
                            .foregroundColor(.red)
                        Spacer()
                    }
                })
            }
        }
        .navigationTitle("AirPlay")
        
        .onDisappear() {
            defaults.set(airplay, forKey: "airplay")
        }
        .onAppear() {
            airplay = defaults.bool(forKey: "airplay")
        }
        .alert("請問是否要退出 !", isPresented: $quit, actions: {
            Button("取消") {
                
            }
            Button("是") {
                defaults.set(airplay, forKey: "airplay")
                exit(0)
            }
        })
    }
}
