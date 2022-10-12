//
//  optionalView.swift
//  AI教你做運動
//
//  Created by HingTatTsang on 21/9/2022.
//

import SwiftUI

struct optionalView: View {
    @Binding var isopen: Bool
    @Binding var pushup: Bool
    @Binding var situp: Bool
    var body: some View {
        NavigationView {
            List {
                Button(action: {
                    isopen = false
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                        pushup = true
                    }
                }, label: {
                    Text("\(NSLocalizedString("仰臥起坐", comment: "仰臥起坐"))")
                })
                Button(action: {
                    isopen = false
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                        situp = true
                    }
                }, label: {
                    Text("\(NSLocalizedString("掌上壓", comment: "掌上壓"))")
                })
            }
            .navigationTitle("可選項目")
            .toolbar() {
                Button("退出") {
                    isopen = false
                }
            }
        }
        
    }
}

