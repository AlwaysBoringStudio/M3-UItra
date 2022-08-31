//
//  errorView.swift
//  M3 UItra
//
//  Created by HingTatTsang on 15/8/2022.
//

import SwiftUI

struct errorView: View {
    var errorcode = ""
    var body: some View {
        HStack {
            Text("Error:")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.blue)
            if errorcode == "" {
                Text("頁面開發中")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.blue)
            } else {
                Text("\(errorcode)")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.blue)
            }
        }
        .padding()
    }
}



struct errorView_Previews: PreviewProvider {
    static var previews: some View {
        errorView(errorcode: "(Preview)")
    }
}
