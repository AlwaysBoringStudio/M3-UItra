//
//  usernameView.swift
//  M3 UItra
//
//  Created by HingTatTsang on 19/8/2022.
//

import SwiftUI

struct usernameView: View {
    @Binding var username: String
    
    var body: some View {
        List {
            Section {
                HStack {
                    Text("你的名字： ")
                        .bold()
                    Spacer()
                    TextEditor(text: $username)
                        .frame(width: 100)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("帳戶")
            
        }
        
    }
}

struct usernameView_Previews: PreviewProvider {
    static var previews: some View {
        settingsView()
    }
}
