//
//  todayView.swift
//  M3 UItra
//
//  Created by HingTatTsang on 18/8/2022.
//

import Foundation
import SwiftUI

struct todayView: View {
    var year: String
    var month: String
    var istoday = false
    @State var refresh = false
    var body: some View {
        // MARK: Today
        if istoday == true {
            ZStack {
                if refresh == true {
                    refreshhelper(refresh: $refresh)
                } else {
                    dateView(date: getday(), month: getmonth(), fullyear: getyear(), today: true)
                    
                }
            }
        } else {
            HStack {
                VStack {
                    Spacer()
                        .frame(height: 10)
                    Rectangle()
                        .foregroundColor(.yellow)
                        .opacity(0.7)
                        .frame(width: 347, height: 140)
                        .overlay() {
                            HStack {
                                VStack {
                                    Spacer()
                                    HStack {
                                        Text(" \(year)年 \(month)月 ")
                                            .font(.largeTitle)
                                            .bold()
                                            .foregroundColor(.black)
                                    }
                                    Spacer()

                                }
                                
                            }
                            

                        }
                }
//                    Rectangle()
//                        .foregroundColor(.blue)
//                        .opacity(0.5)
//                        .frame(width: 90, height: 100)
//                        .overlay() {
//                            VStack {
//                                HStack {
//                                    Text("是日課程")
//                                        .font(.title3)
//                                        .foregroundColor(.black)
//                                }
//                                Text(" \(name)")
//                                    .bold()
//                                    .foregroundColor(.black)
//                                Text(" \(starttime)")
//                                    .bold()
//                                    .foregroundColor(.black)
//                                Text(" \(endtime)")
//                                    .bold()
//                                    .foregroundColor(.black)
//                            }
//                        }
//
                }
            
        }
    }
    func getmonth() -> String {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM"
        return dateFormatter.string(from: date)
    }
    func getday() -> String {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd"
        return dateFormatter.string(from: date)
    }
    func getyear() -> String {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        return dateFormatter.string(from: date)
    }
    func getDayOfWeektoday() -> String {
        
        let weekDays = [
            "星期日",
            "星期一",
            "星期二",
            "星期三",
            "星期四",
            "星期五",
            "星期六"
        ]

        let myDate = Date()
        
        let myCalendar = Calendar(identifier: .gregorian)
        let weekDay = myCalendar.component(.weekday, from: myDate)
        
        
        return weekDays[weekDay-1]
    }
}




struct todayView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
            todayView(year: "2022", month: "08", istoday: true)
        }
        
    }
}
