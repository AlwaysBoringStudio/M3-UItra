//
//  Calendar.swift
//  M3 UItra
//
//  Created by HingTatTsang on 15/8/2022.
//

import SwiftUI

struct CalendarContentView: View {
    
    @State var date = Date()

    @State var searchDate = Date()
    let dateChanged = Date()
    
    @Environment(\.calendar) var calendar
    private var year: DateInterval {
        calendar.dateInterval(of: .month, for: date)!
    }
    var body: some View {
        CalendarView(interval: self.year) { date in
            dateView(date: (String(self.calendar.component(.day, from: date))), itemnumber: 2, item1: "Sit Up: 100", item2: "Sit Up: 100", item3: "", item4: "", name: "陳老師", starttime: "7:00 a.m.", endtime: "7:30 a.m.", holiday: false, month: "8", fullyear: "2022")
            
        }
    }
}



struct CalendarContentView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            CalendarContentView()
        }
    }
}

