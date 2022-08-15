//
//  errorView.swift
//  M3 UItra
//
//  Created by HingTatTsang on 15/8/2022.
//

import SwiftUI
import WebKit

struct errorView: View {
    var body: some View {
        Text("唔好咁天真, 邊有可能咁快做得完")
            .font(.largeTitle)
            .bold()
            .foregroundColor(.blue)
    }
}

struct WebView: UIViewRepresentable {

    var url: URL

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}


struct errorView_Previews: PreviewProvider {
    static var previews: some View {
        errorView()
    }
}
