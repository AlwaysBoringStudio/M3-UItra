//
//  langsupport.swift
//  AI教你做運動
//
//  Created by HingTatTsang on 28/8/2022.
//

import Foundation
import SwiftUI

struct langView: View {
    @State var quit = false
    var body: some View {
        List {
            HStack {
                Spacer()
                Button("English") {
                    UserDefaults.standard.set(["en"], forKey: "AppleLanguages")
                    quit = true
                }
                Spacer()
            }
            HStack {
                Spacer()
                Button("中文(香港)") {
                    UserDefaults.standard.set(["zh-HK"], forKey: "AppleLanguages")
                    quit = true
                }
                Spacer()
            }
            
        }
        .navigationTitle("語言")
        .alert("退出此App以保存更改", isPresented: $quit, actions: {
            Button("取消") {
                
            }
            Button("退出") {
                exit(0)
            }
        })
    }
}
