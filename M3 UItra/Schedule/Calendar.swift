//
//  Calendar.swift
//  M3 UItra
//
//  Created by HingTatTsang on 15/8/2022.
//

import SwiftUI

struct CalendarContentView: View {
    var date: Date

    @Environment(\.calendar) var calendar
    private var year: DateInterval {
        calendar.dateInterval(of: .month, for: date)!
    }
    
    var body: some View {
        CalendarView(interval: self.year) { date in
            dateView(date: (String(self.calendar.component(.day, from: date))), itemnumber: 2, item1: getdateyear(date: date), item2: getdatemonth(date: date), item3: "", item4: "", name: "陳老師", starttime: "7:00 a.m.", endtime: "7:30 a.m.", holiday: false, month: getdatemonth(date: date), fullyear: getdateyear(date: date))
            
        }
    }
    func getdatemonth(date: Date) -> String {
        let date = date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM"
        return dateFormatter.string(from: date)
    }
    
    func getdateyear(date: Date) -> String {
        let date = date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        return dateFormatter.string(from: date)
    }
    
    
}



struct CalendarContentView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
//            CalendarContentView(date: <#Date#>)
        }
    }
}

