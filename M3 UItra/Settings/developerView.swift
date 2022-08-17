//
//  developerView.swift
//  M3 UItra
//
//  Created by HingTatTsang on 17/8/2022.
//

import SwiftUI
import WebKit

struct readmeView: UIViewRepresentable {
  @Binding var text: String
   
  func makeUIView(context: Context) -> WKWebView {
    return WKWebView()
  }
   
  func updateUIView(_ uiView: WKWebView, context: Context) {
    uiView.loadHTMLString(text, baseURL: nil)
  }
}


struct developerView: View {
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
    @State var developermode = 10
    @State var showAlert = false
    @State var showAlert2 = false
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
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
                Text("1.1.0")
                    .foregroundColor(colorScheme == .dark ? .white : .black)
            }
        })
        Group {
            if developermode == 0 {
                Section {
                    NavigationLink(destination: WebView(url: URL(string: "https://github.com/AlwaysBoringStudio/M3-UItra")!).navigationTitle("GitHub").navigationBarTitleDisplayMode(.inline)) {
                        Text("GitHub")
                    }
                    
                }
                Section {
                    NavigationLink(destination: readmeView(text: $text).navigationTitle("README.md").navigationBarTitleDisplayMode(.inline)) {
                        Text("README.md")
                    }
                    
                }
                Section {
                    NavigationLink(destination: ContentView()) {
                        Text("ContentView()")
                    }
                    NavigationLink(destination: practiceView()) {
                        Text("practiceView()")
                    }
                    NavigationLink(destination: scheduleView()) {
                        Text("scheduleView()")
                    }
                    NavigationLink(destination: dateView(date: "12", itemnumber: 2, item1: "Sit Up: 100", item2: "Sit Up: 100", item3: "", item4: "", name: "陳老師", starttime: "7:00 a.m.", endtime: "7:30 a.m.", holiday: false, month: "8", fullyear: "2022")) {
                        Text("""
    dateView(date: "12", itemnumber: 2, item1: "Sit Up: 100", item2: "Sit Up: 100", item3: "", item4: "", name: "陳老師", starttime: "7:00 a.m.", endtime: "7:30 a.m.", holiday: false, month: "8", fullyear: "2022")
    """)
                    }
                    NavigationLink(destination: aiView()) {
                        Text("aiView()")
                    }
                    
                    NavigationLink(destination: errorView()) {
                        Text("errorView()")
                    }
                    
                }
            }
        }
        
        
        .alert("You are developer now !", isPresented: $showAlert, actions: {
                    Button("OK") { }
        })
        .alert("You are developer already !", isPresented: $showAlert2, actions: {
            Button("Cancel") {
                developermode = 10
            }
            Button("OK") {
            }
               
        })
    }
}


struct developerView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            List {
                developerView(developermode: 0)
            }
            .navigationTitle("Developer View")
        }
    }
}
