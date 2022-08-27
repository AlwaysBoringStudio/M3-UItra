//
//  settingsView.swift
//  M3 UItra
//
//  Created by HingTatTsang on 15/8/2022.
//

import SwiftUI
import AVFoundation

struct settingsView: View {
    let defaults = UserDefaults.standard
    @State var username = "USERNAME"
    @State var notifyon = false
    @State var showwelcome = false
    @Binding var refresh: Bool
    
    
    @State var health = Float(0)
    
    @State var clear = false
    
    @State var developermode = 10
    @State var showAlert = false
    @State var showAlert2 = false
    
    @State var text = """
                        <meta name="viewport" content="width=device-width, initial-scale=0.9">
                        <h1 id="m3-uitra">M3-UItra</h1>
                        <h1 id="此-app-會用到下列的功能：">此 App 會用到下列的功能：</h1>
                        <ol>
                        <li>CoreML - Vision</li>
                        <li>Bluetooth </li>
                        <li>Internet</li>
                        <li>Health Kit</li>
                        <li>Cloud Kit</li>
                        </ol>
                        <h1 id="需要增加的功能：">需要增加的功能：</h1>
                        <ol>
                        <li>運動動作偵測</li>
                        <li>支援 iPad UI</li>
                        <li>支援 Dark Mode</li>
                        <li>任務的 Pie Chart </li>
                        <li>卡路里計算</li>
                        <li>從 Healthy Kit 取得 Apple Watch 的心跳記錄</li>
                        <li>便用 CloudKit 同步 iPhone 和 iPad 的使用者數據</li>
                        <li>更改勳章名稱</li>
                        <li>加入課程連接功能</li>
                        <li>日程表</li>
                        <li>帳戶，通知，和儲存空間感知器</li>
                        </ol>
                        """
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    NavigationLink(destination: usernameView(username: $username, refresh: $refresh)) {
                        HStack {
                            Image(systemName: "person.circle")
                                .resizable()
                                .frame(width: 50, height: 50)
                            VStack {
                                HStack {
                                    Text(username)
                                        .font(.title3)
                                    Spacer()
                                }
                                HStack {
                                    Text("設定你的名稱")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                    Spacer()
                                }
                            }
                        }
                    }
                }
                Section {
                    NavigationLink(destination: notifyView(notifyon: $notifyon)) {
                        HStack {
                            Image(systemName: "bell.circle")
                            Text("通知")
                        }
                    }
                    
                    
                }
                Section {
                    NavigationLink(destination: langView()) {
                        HStack {
                            Image(systemName: "globe")
                            Text("語言")
                        }
                    }
                    
                    
                }
                
                
                Button(action: {
                    if developermode == 0 {
                        showAlert2 = true
                    } else if developermode == 1 {
                        showAlert = true
                        developermode = developermode - 1
                    } else {
                        developermode = developermode - 1
                    }
                }, label: {
                    HStack {
                        Text("版本:")
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                        Spacer()
                        Text(UIApplication.appVersion ?? "")
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                    }
                })
                
                Group {
                    if developermode == 0 {
                        Section {
                            NavigationLink(destination: developerView(refresh: $refresh)) {
                                Text("開發人員選項")
                            }
                        }
                        
                    }
                }
                Section(header: Text("清除所有數據")) {
                    Button(action: {
                        clear = true
                    }, label: {
                        HStack {
                            Spacer()
                            Text("清除此應用的所有數據")
                                .foregroundColor(.red)
                            Spacer()
                        }
                    })
                }
                
                
            }
            .navigationTitle("設定")
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
        
        .onAppear() {
            username = defaults.string(forKey: "username") ?? "USERNAME"
            notifyon = defaults.bool(forKey: "notifyon")
            health = defaults.float(forKey: "health")
            
            
        }
        
        .alert("恭喜你, 你已經成為開發人員 !", isPresented: $showAlert, actions: {
                    Button("完成") { }
        })
        .alert("不需要了, 你已經是開發人員 !", isPresented: $showAlert2, actions: {
            Button("取消開發人員模式") {
                developermode = 10
            }
            Button("好") {
            }
               
        })
        .alert("清除此應用的所有數據，是否繼續 ?", isPresented: $clear, actions: {
            Button("取消") {
                
            }
            Button("是") {
                let dictionary = defaults.dictionaryRepresentation()
                dictionary.keys.forEach { key in
                    defaults.removeObject(forKey: key)
                }
                refresh = true
                exit(0)
                
                
            }
            
        })
        
        
    }
    
}



