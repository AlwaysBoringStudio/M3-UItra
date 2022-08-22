//
//  errorView.swift
//  M3 UItra
//
//  Created by HingTatTsang on 15/8/2022.
//

import SwiftUI

struct errorView: View {
    var errorcode = "頁面開發中"
    var body: some View {
        Text("Error: \(errorcode)")
            .font(.largeTitle)
            .bold()
            .foregroundColor(.blue)
            .padding()
    }
}



struct errorView_Previews: PreviewProvider {
    static var previews: some View {
        errorView(errorcode: "(Preview)")
    }
}
