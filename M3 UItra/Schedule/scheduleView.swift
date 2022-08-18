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
                monthView(year: "2022", month: "\($0)")
                    .tag($0)
            }
            monthView(year: year, month: month, istoday: true)
                .tag(nowdate(format: "MM"))
            ForEach((((monthInt ?? 1)+1)...12), id: \.self) {
                monthView(year: "2022", month: "\($0)")
                    .tag($0)
            }
            
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
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
                CalendarContentView()
                
            }
            .padding(.top)
            todayView(year: year, month: month, istoday: istoday)
        }
        .edgesIgnoringSafeArea(.all)
    }
}




struct scheduleView_Previews: PreviewProvider {
    static var previews: some View {
        scheduleView()
    }
}

