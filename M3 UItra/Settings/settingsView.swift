//
//  settingsView.swift
//  M3 UItra
//
//  Created by HingTatTsang on 15/8/2022.
//

import SwiftUI

struct settingsView: View {
    var body: some View {
        NavigationView {
            List {
                
                Section {
                    NavigationLink(destination: errorView()) {
                        HStack {
                            Image(systemName: "person.circle")
                                .resizable()
                                .frame(width: 50, height: 50)
                            VStack {
                                HStack {
                                    Text("帳戶")
                                        .font(.title3)
                                    Spacer()
                                }
                                HStack {
                                    Text("Username")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                    Spacer()
                                }
                            }
                        }
                    }
                }
                Section {
                    NavigationLink(destination: errorView()) {
                        HStack {
                            Image(systemName: "bell.circle")
                            Text("通知")
                        }
                    }
                    NavigationLink(destination: errorView()) {
                        HStack {
                            Image(systemName: "externaldrive")
                            Text("儲存空間")
                        }
                    }
                }
                developerView()
            }
            .navigationTitle("設定")
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
        
        
        
    }
}


struct settingsView_Previews: PreviewProvider {
    static var previews: some View {
        settingsView()
    }
}
