//
//  scheduleView.swift
//  M3 UItra
//
//  Created by HingTatTsang on 15/8/2022.
//

import SwiftUI

struct scheduleView: View {
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Rectangle()
                        .foregroundColor(.yellow)
                        .opacity(0.7)
                        .frame(width: 250, height: 100)
                        .overlay() {
                            VStack {
                                Spacer()
                                HStack {
                                    Text("2022年")
                                        .padding(.horizontal)
                                    Spacer()
                                }
                                Text("8月11日")
                                    .font(.largeTitle)
                                    .bold()
                                Spacer()
                                
                            }
                            
                        }
                    Rectangle()
                        .foregroundColor(.blue)
                        .opacity(0.5)
                        .frame(width: 90, height: 100)
                        .overlay() {
                            VStack {
                                Text("是日課程")
                                    .font(.title3)
                                HStack {
                                    Text(" 陳老師")
                                        .bold()
                                    Spacer()
                                }
                                HStack {
                                    Text(" 7:00 a.m.")
                                        .bold()
                                    Spacer()
                                }
                                HStack {
                                    Text(" 7:30 a.m.")
                                        .bold()
                                    Spacer()
                                }
                            }
                        }
                }
                dateView(date: "12", itemnumber: 2, item1: "Sit Up: 100", item2: "Sit Up: 100", item3: "", item4: "", name: "陳老師", starttime: "7:00 a.m.", endtime: "7:30 a.m.", holiday: false, month: "8", fullyear: "2022")
                dateView(date: "13", itemnumber: 2, item1: "Sit Up: 100", item2: "Sit Up: 100", item3: "", item4: "", name: "陳老師", starttime: "7:00 a.m.", endtime: "7:30 a.m.", holiday: false, month: "8", fullyear: "2022")
                dateView(date: "14", itemnumber: 2, item1: "Sit Up: 100", item2: "Sit Up: 100", item3: "", item4: "", name: "陳老師", starttime: "7:00 a.m.", endtime: "7:30 a.m.", holiday: true, month: "8", fullyear: "2022")
                dateView(date: "15", itemnumber: 2, item1: "Sit Up: 100", item2: "Sit Up: 100", item3: "", item4: "", name: "陳老師", starttime: "7:00 a.m.", endtime: "7:30 a.m.", holiday: false, month: "8", fullyear: "2022")
                dateView(date: "16", itemnumber: 2, item1: "Sit Up: 100", item2: "Sit Up: 100", item3: "", item4: "", name: "陳老師", starttime: "7:00 a.m.", endtime: "7:30 a.m.", holiday: false, month: "8", fullyear: "2022")
                dateView(date: "17", itemnumber: 2, item1: "Sit Up: 100", item2: "Sit Up: 100", item3: "", item4: "", name: "陳老師", starttime: "7:00 a.m.", endtime: "7:30 a.m.", holiday: false, month: "8", fullyear: "2022")
                dateView(date: "18", itemnumber: 2, item1: "Sit Up: 100", item2: "Sit Up: 100", item3: "", item4: "", name: "陳老師", starttime: "7:00 a.m.", endtime: "7:30 a.m.", holiday: false, month: "8", fullyear: "2022")
            }
        }
    }
}




struct circleView: View {
    var name: String
    var color: Color
    var body: some View {
        Circle()
            .foregroundColor(color)
            .frame(width: 90, height: 90)
            .overlay() {
                Image(systemName: name)
                    .resizable()
                    .scaledToFit()
                    .padding()
            }
    }
}


struct scheduleView_Previews: PreviewProvider {
    static var previews: some View {
        scheduleView()
    }
}
