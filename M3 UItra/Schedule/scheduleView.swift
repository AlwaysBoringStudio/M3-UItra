//
//  scheduleView.swift
//  M3 UItra
//
//  Created by HingTatTsang on 15/8/2022.
//

import SwiftUI
import Foundation

struct scheduleView: View {
    @Binding var refresh: Bool
    var month = nowdate(format: "MM")
    var year = nowdate(format: "yyyy")
    @State var selection = nowdate(format: "MM")
    var body: some View {
        let monthInt = Int(month)
        TabView(selection:$selection) {
            ForEach((1..<(monthInt ?? 12)), id: \.self) {
                let new = correctdate(num: "\($0)")
                monthView(year: year, month: new)
                    .tag($0)
            }
            let new = correctdate(num: nowdate(format: "MM"))
            monthView(year: year, month: new, istoday: true)
                .tag(nowdate(format: "MM"))
            
            ForEach((((monthInt ?? 1)+1)...12), id: \.self) {
                let new = correctdate(num: "\($0)")
                monthView(year: year, month: new)
                    .tag($0)
            }
            
            
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .onDisappear() {
            refresh = true
        }
    }
    func correctdate(num: String) -> String {
        let add0 = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
        var new = ""
        if add0.contains(num) {
            new = ("0\(num)")
        } else {
            new = ("\(num)")
        }
        return new
    }
}


struct monthView: View {
    var year: String
    var month: String
    var istoday = false
    var body: some View {
        ZStack {
            Color.white
            VStack {
                Spacer()
                    .frame(height: 150)
                VStack {
                    ScrollView(showsIndicators: false) {
                        Spacer()
                            .frame(height: 18)
                        let imdate = "\(year)-\(month)"
                        let date = getdate(importdate: imdate)

                        CalendarContentView(date: date)

                    }
                }
            }
            ZStack {
                VStack {
                    Group {
                        Color.white
                            .frame(height: 160)
                            .edgesIgnoringSafeArea(.all)
                    }
                    Spacer()
                    
                }
                VStack {
                    Group {
                        VStack {
                            todayView(year: year, month: month, istoday: istoday)
                            LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.01), Color.white]),startPoint: .bottom, endPoint: .top)
                                .frame(height: 15)

                        }
                    }
                    Spacer()
                }
                
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
    func getdate(importdate: String) -> Date {
        let isoDate = importdate

        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "yyyy-MM"
        let date = dateFormatter.date(from:isoDate) ?? Date()
        return date
    }
}




