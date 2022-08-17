//
//  developerView.swift
//  M3 UItra
//
//  Created by HingTatTsang on 17/8/2022.
//

import SwiftUI

struct readmeView: View {
    var body: some View {
        ScrollView {
            Image("deve")
                .resizable()
                .scaledToFit()
        }
        .navigationTitle("README.md")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct developerView: View {
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
                    NavigationLink(destination: readmeView()) {
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
