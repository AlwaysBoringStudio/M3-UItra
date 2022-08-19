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
    var body: some View {
        // MARK: Today
        if istoday == true {
            VStack {
                Color.white
                    .frame(height: 100)
                    .edgesIgnoringSafeArea(.all)
                Spacer()
            }
            VStack {
                ZStack {
                    VStack {
                        Color.white
                            .frame(height: 93)
                    }
                    VStack {
                        ZStack {
                            Color.white
                                .frame(height: 100)
                            HStack {
                                VStack {
                                    Rectangle()
                                        .foregroundColor(.yellow)
                                        .opacity(0.7)
                                        .frame(width: 250, height: 100)
                                        .overlay() {
                                            HStack {
                                                VStack {
                                                    Spacer()
                                                    HStack {
                                                        Text("\(nowdate(format: "yyyy"))年 \(getDayOfWeektoday())")
                                                            .foregroundColor(.black)
                                                            .padding(.horizontal)
                                                    }
                                                    Text("\(nowdate(format: "MM"))月\(nowdate(format: "dd"))日 ")
                                                        .font(.title)
                                                        .bold()
                                                        .foregroundColor(.black)
                                                    Spacer()
                                                    
                                                    
                                                }
                                                VStack {
                                                    Text(" · 沒有數據")
                                                        .bold()
                                                        .foregroundColor(.black)
                                                    Text(" · 沒有數據")
                                                        .bold()
                                                        .foregroundColor(.black)
                                                    Text(" · 沒有數據")
                                                        .bold()
                                                        .foregroundColor(.black)
                                                }
                                            }
                                            
                                        }
                                        
                                    }
                                Rectangle()
                                    .foregroundColor(.blue)
                                    .opacity(0.5)
                                    .frame(width: 90, height: 100)
                                    .overlay() {
                                        VStack {
                                            HStack {
                                                Text("是日課程")
                                                    .font(.title3)
                                                    .foregroundColor(.black)
                                            }
                                            Text("沒有數據")
                                                .bold()
                                                .foregroundColor(.black)
                                            Text("沒有數據")
                                                .bold()
                                                .foregroundColor(.black)
                                            Text("沒有數據")
                                                .bold()
                                                .foregroundColor(.black)
                                        }
                                    }
                            }
                        }
                        LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.01), Color.white]),startPoint: .bottom, endPoint: .top)
                            .frame(height: 15)

                    }
                }
                
                Spacer()
            }
            .padding(.top)
        } else {
            VStack {
                Color.white
                    .frame(height: 100)
                    .edgesIgnoringSafeArea(.all)
                Spacer()
            }
            VStack {
                ZStack {
                    VStack {
                        Color.white
                            .frame(height: 93)
                    }
                    VStack {
                        ZStack {
                            Color.white
                                .frame(height: 100)
                            HStack {
                                VStack {
                                    Rectangle()
                                        .foregroundColor(.yellow)
                                        .opacity(0.7)
                                        .frame(width: 350, height: 100)
                                        .overlay() {
                                            VStack {
                                                Spacer()
                                                Text("\(year)年 \(month)月")
                                                    .font(.largeTitle)
                                                    .bold()
                                                    .foregroundColor(.black)
                                                Spacer()
                                                
                                            }
                                            
                                        }
                                        
                                    }
                                
                            }
                        }
                        LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.01), Color.white]),startPoint: .bottom, endPoint: .top)
                            .frame(height: 15)

                    }
                }
                
                Spacer()
            }
            .padding(.top)
        }
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
