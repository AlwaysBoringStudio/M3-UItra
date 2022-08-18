//
//  scheduleView.swift
//  M3 UItra
//
//  Created by HingTatTsang on 15/8/2022.
//

import SwiftUI

struct scheduleView: View {
    var month = nowdate(format: "MM")
    var year = nowdate(format: "yyyy")
    @State var selection = nowdate(format: "MM")
    var body: some View {
        let monthInt = Int(month)
        TabView(selection:$selection) {
            ForEach((1..<(monthInt ?? 12)), id: \.self) {
                let new = correctdate(num: "\($0)")
                monthView(year: "2022", month: new)
                    .tag($0)
            }
            let new = correctdate(num: nowdate(format: "MM"))
            monthView(year: year, month: new, istoday: true)
                .tag(nowdate(format: "MM"))
            
            ForEach((((monthInt ?? 1)+1)...12), id: \.self) {
                let new = correctdate(num: "\($0)")
                monthView(year: "2022", month: new)
                    .tag($0)
            }
            
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
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
            // MARK: List
            ScrollView {
                Spacer()
                    .frame(height: 100)
                
                let imdate = "\(year)-\(month)"
                let date = getdate(importdate: imdate)
                
                CalendarContentView(date: date)
                
            }
            .padding(.top)
            todayView(year: year, month: month, istoday: istoday)
        }
        .edgesIgnoringSafeArea(.all)
    }
    func getdate(importdate: String) -> Date {
        print(importdate)
        let isoDate = importdate

        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "yyyy-MM"
        let date = dateFormatter.date(from:isoDate) ?? Date()
        return date
    }
}




struct scheduleView_Previews: PreviewProvider {
    static var previews: some View {
        scheduleView()
    }
}

