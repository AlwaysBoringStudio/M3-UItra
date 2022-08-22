//
//  developerView.swift
//  M3 UItra
//
//  Created by HingTatTsang on 17/8/2022.
//

import SwiftUI
import WebKit

struct developerView: View {
    let defaults = UserDefaults.standard
    @State var health = Float(0)
    @Binding var refresh: Bool
    @State var username = ""
    @State var notifyon = false
    @State var firstopen = ""
    @State var showwelcome = false
    @State var caltoday = Float(0)
    @State var reward: Int = 0
    @State var textedit = Float(0)
    @State var demo = false
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
    var body: some View {
        List {
            Section(header: Text("得獎等級(1-6)參數修改器")) {
                HStack {
                    Slider(value: $textedit, in: 0...6)
                    Text("\(Int(textedit))")
                }
            }
            Section(header: Text("其他參數")) {
                Text("String: username = \(username)")
                Text("String: firseopen = \(firstopen)")
                Text("Float: health = \(health)")
                Text("Float: caltoday = \(caltoday)")
                Text("Int: reward = \(reward)")
                if notifyon == true {
                    Text("Bool: notifyon = true")
                } else {
                    Text("Bool: notifyon = false")
                }
                if showwelcome == true {
                    Text("Bool: showwelcome = true")
                } else {
                    Text("Bool: showwelcome = false")
                }
            }
            Section(header: Text("所有已儲存的變數")) {
                let alldata = Array(defaults.dictionaryRepresentation().keys)
                ForEach(alldata, id: \.self) { i  in
                    Text("\(i)")
                }
            }
            Section(header: Text("GitHub")) {
                NavigationLink(destination: WebView(url: URL(string: "https://github.com/AlwaysBoringStudio/M3-UItra")!).navigationTitle("GitHub").navigationBarTitleDisplayMode(.inline)) {
                    Text("GitHub")
                }
                NavigationLink(destination: readmeView(text: $text).navigationTitle("README.md").navigationBarTitleDisplayMode(.inline)) {
                    Text("README.md")
                }
                
                
                
            }
            Section(header: Text("Bug")) {
                NavigationLink(destination: WebView(url: URL(string: "https://github.com/AlwaysBoringStudio/M3-UItra/issues")!).navigationTitle("GitHub").navigationBarTitleDisplayMode(.inline)) {
                    HStack {
                        Image(systemName: "exclamationmark.triangle.fill")
                            .resizable()
                            .foregroundColor(.red)
                            .padding(5)
                            .frame(width: 50, height: 50)
                            
                        VStack {
                            HStack {
                                Text("已知的Bug")
                                    .font(.title3)
                                Spacer()
                            }
                            HStack {
                                Text("按此查看已知的Bug")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                Spacer()
                            }
                        }
                    }
                }
            }
            Section(header: Text("演示模式")) {
                Button(action: {
                    demo = true
                }, label: {
                    HStack {
                        Spacer()
                        Text("演示模式")
                            .foregroundColor(.red)
                        Spacer()
                    }
                })
            }
            
        }
        .navigationTitle("開發人員選項")
        .onDisappear() {
            reward = Int(textedit)
            defaults.set(reward, forKey: "reward")
            refresh = true
        }
        .onAppear() {
            username = defaults.string(forKey: "username") ?? "USERNAME"
            notifyon = defaults.bool(forKey: "notifyon")
            health = defaults.float(forKey: "health")
            firstopen = defaults.string(forKey: "firstopen") ?? "ERROR"
            showwelcome = defaults.bool(forKey: "showwelcome")
            caltoday = defaults.float(forKey: "caltoday")
            reward = defaults.integer(forKey: "reward")
            textedit = Float(reward)
        }
        .alert("演示模式將清除此應用的所有數據，是否繼續 ?", isPresented: $demo, actions: {
            Button("取消") {
                
            }
            Button("是") {
                let dictionary = defaults.dictionaryRepresentation()
                dictionary.keys.forEach { key in
                    defaults.removeObject(forKey: key)
                }
                defaults.set(Int(6), forKey: "reward")
                defaults.set(String("John Appleseed"), forKey: "username")
                defaults.set(String(""), forKey: "firstopen")
                defaults.set(Bool(true), forKey: "showwelcome")
                defaults.set(Bool(false), forKey: "notifyon")
                testdata(datatoday: Date(), datacal: 1823)
                testdata(datatoday: yesterDay(pre: 1), datacal: 1920)
                testdata(datatoday: yesterDay(pre: 2), datacal: 1080)
                testdata(datatoday: yesterDay(pre: 3), datacal: 720)
                testdata(datatoday: yesterDay(pre: 4), datacal: 768)
                testdata(datatoday: yesterDay(pre: 5), datacal: 148)
                testdata(datatoday: yesterDay(pre: 6), datacal: 1360)
                refresh = true
                exit(0)
            }
        })
    }
    func yesterDay(pre: Int) -> Date {
        var dayComponent = DateComponents()
        dayComponent.day = Int(String("-\(Int(pre))"))
        let calendar = Calendar.current
        let nextDay =  calendar.date(byAdding: dayComponent, to: Date())!
        return nextDay
    }
    func testdata(datatoday: Date, datacal: Int) -> Void {
        let today = datatoday
        let formatter1 = DateFormatter()
        formatter1.dateFormat = "dd/MM/yyyy"
        let datedatanow = "\(formatter1.string(from: today))"
        defaults.set(datacal, forKey: "\(datedatanow)datacal")
    }

    
       
}
struct readmeView: UIViewRepresentable {
  @Binding var text: String
   
  func makeUIView(context: Context) -> WKWebView {
    return WKWebView()
  }
   
  func updateUIView(_ uiView: WKWebView, context: Context) {
    uiView.loadHTMLString(text, baseURL: nil)
  }
}

