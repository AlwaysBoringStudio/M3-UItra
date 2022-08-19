//
//  dateView.swift
//  M3 UItra
//
//  Created by HingTatTsang on 15/8/2022.
//

import SwiftUI

struct dateView: View {
    @State var date: String
    @State var itemnumber: Int
    @State var item1: String
    @State var item2: String
    @State var item3: String
    @State var item4: String
    @State var name: String
    @State var starttime: String
    @State var endtime: String
    @State var holiday: Bool
    
    @State var month: String
    @State var fullyear: String
    
    @State var popover = false
    
    @State var weekday = ""
    var body: some View {
        VStack {
            if holiday == true {
                Rectangle()
                    .foregroundColor(.red)
                    .opacity(0.8)
                    .frame(width: 347, height: 100)
                    .overlay() {
                        VStack {
                            HStack {
                                Text("\(correctdate(num: date))日  Holiday")
                                    .bold()
                                    .font(.largeTitle)
                                    .foregroundColor(.black)
                            }
                            
                        }
                    }
            } else {
                Button(action: {
                    popover = true
                }) {
                    HStack {
                        Rectangle()
                            .foregroundColor(.black)
                            .opacity(0.5)
                            .frame(width: 70, height: 100)
                            .overlay() {
                                VStack {
                                    Text("\(correctdate(num: date))日")
                                        .bold()
                                        .font(.title3)
                                        .foregroundColor(.black)
                                    Text(getdayofweeknow())
                                        .bold()
                                        .foregroundColor(.black)
                                    
                                }
                            }
                            
                        Rectangle()
                            .foregroundColor(.red)
                            .opacity(0.6)
                            .frame(width: 170, height: 100)
                            .overlay() {
                                VStack {
                                    if itemnumber == 1 {
                                        HStack {
                                            Text(" · \(item1)")
                                                .bold()
                                                .foregroundColor(.black)
                                            Spacer()
                                        }
                                    } else if itemnumber == 2 {
                                        HStack {
                                            Text(" · \(item1)")
                                                .bold()
                                                .foregroundColor(.black)
                                            Spacer()
                                        }
                                        HStack {
                                            Text(" · \(item2)")
                                                .bold()
                                                .foregroundColor(.black)
                                            Spacer()
                                        }
                                    } else if itemnumber == 3 {
                                        HStack {
                                            Text(" · \(item1)")
                                                .bold()
                                                .foregroundColor(.black)
                                            Spacer()
                                        }
                                        HStack {
                                            Text(" · \(item2)")
                                                .bold()
                                                .foregroundColor(.black)
                                            Spacer()
                                        }
                                        HStack {
                                            Text(" · \(item3)")
                                                .bold()
                                                .foregroundColor(.black)
                                            Spacer()
                                        }
                                    } else if itemnumber == 4 {
                                        HStack {
                                            Text(" · \(item1)")
                                                .bold()
                                                .foregroundColor(.black)
                                            Spacer()
                                        }
                                        HStack {
                                            Text(" · \(item2)")
                                                .bold()
                                                .foregroundColor(.black)
                                            Spacer()
                                        }
                                        HStack {
                                            Text(" · \(item3)")
                                                .bold()
                                                .foregroundColor(.black)
                                            Spacer()
                                        }
                                        HStack {
                                            Text(" · \(item4)")
                                                .bold()
                                                .foregroundColor(.black)
                                            Spacer()
                                        }
                                    } else {
                                        Text("Error")
                                            .font(.largeTitle)
                                            .foregroundColor(.black)
                                    }
                                    
                                }
                            }
                        Rectangle()
                            .foregroundColor(.green)
                            .opacity(0.5)
                            .frame(width: 90, height: 100)
                            .overlay() {
                                VStack {
                                    HStack {
                                        Text(" \(name)")
                                            .bold()
                                            .foregroundColor(.black)
                                        Spacer()
                                    }
                                    HStack {
                                        Text(" \(starttime)")
                                            .bold()
                                            .foregroundColor(.black)
                                        Spacer()
                                    }
                                    HStack {
                                        Text(" \(endtime)")
                                            .bold()
                                            .foregroundColor(.black)
                                        Spacer()
                                    }
                                    
                                    
                                }
                            }
                    }
                }
                
            }
                
        }
            .popover(isPresented: $popover) {
                ZStack {
                    Color.white
                        .edgesIgnoringSafeArea(.all)
                    VStack {
                        VStack {
                            Rectangle()
                                .foregroundColor(.yellow)
                                .opacity(0.7)
                                .frame(width: 347, height: 100)
                                .overlay() {
                                    VStack {
                                        Spacer()
                                        HStack {
                                            Text("\(fullyear)年")
                                                .foregroundColor(.black)
                                                .padding(.horizontal)
                                            Spacer()
                                        }
                                        Text("\(correctdate(num: month))月\(correctdate(num: date))日 (\(getdayofweeknow()))")
                                            .foregroundColor(.black)
                                            .font(.largeTitle)
                                            .bold()
                                        
                                        Spacer()
                                    }
                                    
                                }
                            Rectangle()
                                .foregroundColor(.blue)
                                .opacity(0.5)
                                .frame(width:347, height: 450)
                                .overlay() {
                                    ZStack {
                                        VStack {
                                            Text("已編排:")
                                                .font(.largeTitle)
                                                .foregroundColor(.black)
                                                .padding()
                                            Spacer()
                                        }
                                        VStack {
                                            if itemnumber == 1 {
                                                HStack {
                                                    Text(" · \(item1)")
                                                        .font(.largeTitle)
                                                        .foregroundColor(.black)
                                                    }
                                            } else if itemnumber == 2 {
                                                HStack {
                                                    Text(" · \(item1)")
                                                        .font(.largeTitle)
                                                        .foregroundColor(.black)
                                                    }
                                                HStack {
                                                    Text(" · \(item2)")
                                                        .font(.largeTitle)
                                                        .foregroundColor(.black)
                                                    }
                                            } else if itemnumber == 3 {
                                                HStack {
                                                    Text(" · \(item1)")
                                                        .font(.largeTitle)
                                                        .foregroundColor(.black)
                                                    }
                                                HStack {
                                                    Text(" · \(item2)")
                                                        .font(.largeTitle)
                                                        .foregroundColor(.black)
                                                    }
                                                HStack {
                                                    Text(" · \(item3)")
                                                        .font(.largeTitle)
                                                        .foregroundColor(.black)
                                                    }
                                            } else if itemnumber == 4 {
                                                HStack {
                                                    Text(" · \(item1)")
                                                        .font(.largeTitle)
                                                        .foregroundColor(.black)
                                                    }
                                                HStack {
                                                    Text(" · \(item2)")
                                                        .font(.largeTitle)
                                                        .foregroundColor(.black)
                                                    }
                                                HStack {
                                                    Text(" · \(item3)")
                                                        .font(.largeTitle)
                                                        .foregroundColor(.black)
                                                    }
                                                HStack {
                                                    Text(" · \(item4)")
                                                        .font(.largeTitle)
                                                        .foregroundColor(.black)
                                                    }
                                            } else {
                                                Text("Error")
                                                    .font(.largeTitle)
                                                    .foregroundColor(.black)
                                            }
                                            
                                        }
                                    }
                                }
                        }
                    }
                }
            }
        
    }
    
    func getdayofweeknow() -> String {
        let datecorrect = correctdate(num: month)
        let datecorrectday = correctdate(num: date)
        let mem = getDayOfWeek("\(datecorrectday)/\(datecorrect)/\(fullyear)", format:"dd/MM/yyyy") ?? ""
        return mem
    }
    
    func getDayOfWeek(_ date:String, format: String) -> String? {
        
        let weekDays = [
            "星期日",
            "星期一",
            "星期二",
            "星期三",
            "星期四",
            "星期五",
            "星期六"
        ]

        let formatter  = DateFormatter()
        formatter.dateFormat = format
        guard let myDate = formatter.date(from: date) else { return nil }
        
        let myCalendar = Calendar(identifier: .gregorian)
        let weekDay = myCalendar.component(.weekday, from: myDate)
        
        
        return weekDays[weekDay-1]
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
    
    
    func getrightdate() -> Date {
        let datecorrect = correctdate(num: month)
        let datecorrectday = correctdate(num: date)
        print("\(fullyear)年\(datecorrect)月\(datecorrectday)日")
        
        let string = "\(datecorrectday)/\(datecorrect)/\(fullyear)"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        dateFormatter.date(from: string)
        return dateFormatter.date(from: string) ?? Date()
    }
    
    
}

struct dateView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            dateView(date: "2", itemnumber: 2, item1: "Sit Up: 100", item2: "Sit Up: 100", item3: "", item4: "", name: "陳老師", starttime: "7:00 a.m.", endtime: "7:30 a.m.", holiday: false, month: "8", fullyear: "2022")
            dateView(date: "3", itemnumber: 2, item1: "Sit Up: 100", item2: "Sit Up: 100", item3: "", item4: "", name: "陳老師", starttime: "7:00 a.m.", endtime: "7:30 a.m.", holiday: false, month: "8", fullyear: "2022")
            dateView(date: "10", itemnumber: 2, item1: "Sit Up: 100", item2: "Sit Up: 100", item3: "", item4: "", name: "陳老師", starttime: "7:00 a.m.", endtime: "7:30 a.m.", holiday: false, month: "8", fullyear: "2022")
            dateView(date: "12", itemnumber: 2, item1: "Sit Up: 100", item2: "Sit Up: 100", item3: "", item4: "", name: "陳老師", starttime: "7:00 a.m.", endtime: "7:30 a.m.", holiday: false, month: "8", fullyear: "2022")
            dateView(date: "20", itemnumber: 2, item1: "Sit Up: 100", item2: "Sit Up: 100", item3: "", item4: "", name: "陳老師", starttime: "7:00 a.m.", endtime: "7:30 a.m.", holiday: false, month: "8", fullyear: "2022")
        }
    }
}
