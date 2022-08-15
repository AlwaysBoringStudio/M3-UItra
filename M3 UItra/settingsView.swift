//
//  settingsView.swift
//  M3 UItra
//
//  Created by HingTatTsang on 15/8/2022.
//

import SwiftUI

struct settingsView: View {
    @State var developermode = 10
    @State var showAlert = false
    @State var showAlert2 = false
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
                            .foregroundColor(.black)
                        Spacer()
                        Text("1.0.0")
                            .foregroundColor(.black)
                    }
                })
                Section {
                    if developermode == 0 {
                        NavigationLink(destination: WebView(url: URL(string: "https://github.com/AlwaysBoringStudio/M3-UItra")!).navigationTitle("GitHub").navigationBarTitleDisplayMode(.inline)) {
                            Text("GitHub")
                        }
                    }
                    
                }
                Section {
                    if developermode == 0 {
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
            .navigationTitle("設定")
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


struct settingsView_Previews: PreviewProvider {
    static var previews: some View {
        settingsView()
    }
}
