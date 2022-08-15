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
                NavigationLink(destination: errorView()) {
                    HStack {
                        Image(systemName: "person")
                        Text("帳戶")
                    }
                }
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
            .navigationTitle("設定")
        }
    }
}
struct settingsView_Previews: PreviewProvider {
    static var previews: some View {
        settingsView()
    }
}
