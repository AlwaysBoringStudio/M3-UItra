//
//  settingsView.swift
//  M3 UItra
//
//  Created by HingTatTsang on 15/8/2022.
//

import SwiftUI

struct settingsView: View {
    let defaults = UserDefaults.standard
    @State var username = "USERNAME"
    @State var notifyon = false
    @State var showwelcome = false
    @Binding var refresh: Bool
    
    @State var health = Float(0)
    
    
    @State var developermode = 10
    @State var showAlert = false
    @State var showAlert2 = false
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
                                    Text("你的名稱設定")
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
                    NavigationLink(destination: airplaysettingsView()) {
                        HStack {
                            Image(systemName: "airplayvideo")
                            Text("AirPlay")
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
                        Text("Version:")
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
                
            }
            .navigationTitle("設定")
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
        
        .onAppear() {
            username = defaults.string(forKey: "username") ?? "USERNAME"
            notifyon = defaults.bool(forKey: "notifyon")
            health = defaults.float(forKey: "health")
            
        }
        
        .alert("恭喜你, 你成為開發人員 !", isPresented: $showAlert, actions: {
                    Button("完成") { }
        })
        .alert("不需要了, 你已經是開發人員 !", isPresented: $showAlert2, actions: {
            Button("取消開發人員模式") {
                developermode = 10
            }
            Button("好") {
            }
               
        })
        
        
    }
}



