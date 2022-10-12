//
//  Widget_ai_sports.swift
//  Widget-ai-sports
//
//  Created by HingTatTsang on 21/9/2022.
//

import WidgetKit
import SwiftUI
import Combine

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate)
            entries.append(entry)
        }
 
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
}

struct Widget_ai_sportsEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        todayView(year: "", month: "", istoday: true, home: true)
        
    }
}



@main
struct Widget_ai_sports: Widget {
    let kind: String = "Widget_ai_sports"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            Widget_ai_sportsEntryView(entry: entry)
        }
        .supportedFamilies([.systemMedium])
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct Widget_ai_sports_Previews: PreviewProvider {
    static var previews: some View {
        Widget_ai_sportsEntryView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}


struct todayView: View {
    var year: String
    var month: String
    var istoday = false
    @State var home = false
    @State var refresh = false
    var body: some View {
        // MARK: Today
        if istoday == true {
            ZStack {
                if refresh == true {
                    refreshhelper(refresh: $refresh)
                } else {
                    dateView(date: getday(), month: getmonth(), fullyear: getyear(), today: true, home: home)
                    
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
            NSLocalizedString("星期日", comment: "星期日"),
            NSLocalizedString("星期一", comment: "星期一"),
            NSLocalizedString("星期二", comment: "星期二"),
            NSLocalizedString("星期三", comment: "星期三"),
            NSLocalizedString("星期四", comment: "星期四"),
            NSLocalizedString("星期五", comment: "星期五"),
            NSLocalizedString("星期六", comment: "星期六")
        ]

        let myDate = Date()
        
        let myCalendar = Calendar(identifier: .gregorian)
        let weekDay = myCalendar.component(.weekday, from: myDate)
        
        
        return weekDays[weekDay-1]
    }
    
}


// MARK: 重新整理
struct refreshhelper: View {
    @Binding var refresh: Bool
    var body: some View {
        Text("refreshing")
        
        .onAppear() {
            refresh = false
        }
        
    }
}

struct dateView: View {
    @State var date: String
    @State var item1 = ""
    @State var item2 = ""
    @State var item3 = ""
    @State var item4 = ""
    @State var cal1 = ""
    @State var cal2 = ""
    @State var cal3 = ""
    @State var cal4 = ""
    @State var starttime = ""
    @State var endtime = ""
    @State var holiday = false
    @State var month: String
    @State var fullyear: String
    
    @State var cn = true
    
    @State var popover = false
    
    @State var weekday = ""
    
    @State var add = false
    @State var adderror = false
    
    @State var alertdata = 0
    
    @State var itemeditdata = ""
    
    @State var itemeditdata1 = false
    @State var itemeditdata2 = false
    @State var itemeditdata3 = false
    @State var itemeditdata4 = false
    
    @State var calmem = ""
    
    @State var today = false
    @State var home = false
    
    var body: some View {
        VStack {
            if home == true {
                ZStack {
                    HStack {
                        VStack {
                            Button(action: {
                                popover = true
                            }, label: {
                                Rectangle()
                                    .foregroundColor(.yellow)
                                    .opacity(0.7)
                                    .overlay() {
                                        HStack {
                                            ZStack {
                                                VStack {
                                                    Spacer()
                                                    HStack {
                                                        Text("\(fullyear)年 \(getdayofweeknow())")
                                                            .foregroundColor(.black)
                                                            .padding(.horizontal)
                                                    }
                                                    Text("\(month)月\(date)日 ")
                                                        .font(.title)
                                                        .bold()
                                                        .foregroundColor(.black)
                                                    Spacer()


                                                }
                                                .frame(width: 173.5)
                                            }
                                            VStack {
                                                if isnil() == true {
                                                    HStack {
                                                        Text("未編排任何活動")
                                                            .bold()
                                                            .foregroundColor(.black)
                                                        
                                                    }
                                                }
                                                if item1 != "" {
                                                    HStack {
                                                        Text(" · \(item1)")
                                                            .bold()
                                                            .foregroundColor(.black)
                                                        Spacer()
                                                        
                                                    }
                                                }
                                                if item2 != "" {
                                                    HStack {
                                                        Text(" · \(item2)")
                                                            .bold()
                                                            .foregroundColor(.black)
                                                        Spacer()
                                                        
                                                    }
                                                }
                                                if item3 != "" {
                                                    HStack {
                                                        Text(" · \(item3)")
                                                            .bold()
                                                            .foregroundColor(.black)
                                                        Spacer()
                                                        
                                                    }
                                                }
                                                if item4 != "" {
                                                    HStack {
                                                        Text(" · \(item4)")
                                                            .bold()
                                                            .foregroundColor(.black)
                                                        Spacer()
                                                        
                                                    }
                                                }
                                                
                                            }
                                        }

                                    }
                                
                            })
                        }
                    
                    }
                }
            } else if today == true {
                HStack {
                    VStack {
                        Spacer()
                            .frame(height: 10)
                        Button(action: {
                            popover = true
                        }, label: {
                            Rectangle()
                                .foregroundColor(.yellow)
                                .opacity(0.7)
                                .frame(width: 347, height: 140)
                                .overlay() {
                                    HStack {
                                        ZStack {
                                            VStack {
                                                Spacer()
                                                HStack {
                                                    Text("\(fullyear)年 \(getdayofweeknow())")
                                                        .foregroundColor(.black)
                                                        .padding(.horizontal)
                                                }
                                                Text("\(month)月\(date)日 ")
                                                    .font(.title)
                                                    .bold()
                                                    .foregroundColor(.black)
                                                Spacer()


                                            }
                                            .frame(width: 173.5)
                                        }
                                        VStack {
                                            if isnil() == true {
                                                HStack {
                                                    Text("未編排任何活動")
                                                        .bold()
                                                        .foregroundColor(.black)
                                                    
                                                }
                                            }
                                            if item1 != "" {
                                                HStack {
                                                    Text(" · \(item1)")
                                                        .bold()
                                                        .foregroundColor(.black)
                                                    Spacer()
                                                    
                                                }
                                            }
                                            if item2 != "" {
                                                HStack {
                                                    Text(" · \(item2)")
                                                        .bold()
                                                        .foregroundColor(.black)
                                                    Spacer()
                                                    
                                                }
                                            }
                                            if item3 != "" {
                                                HStack {
                                                    Text(" · \(item3)")
                                                        .bold()
                                                        .foregroundColor(.black)
                                                    Spacer()
                                                    
                                                }
                                            }
                                            if item4 != "" {
                                                HStack {
                                                    Text(" · \(item4)")
                                                        .bold()
                                                        .foregroundColor(.black)
                                                    Spacer()
                                                    
                                                }
                                            }
                                            
                                        }.frame(width: 173.5)
                                    }

                                }
                        })
                        
                        
                    }
                
                }
            } else {
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
                        if getrightdate() != getdatecom() {
                            popover = true
                        }
                        
                        
                    }) {
                        HStack {
                            if getrightdate() == getdatecom() {
                                
                                Rectangle()
                                    .foregroundColor(.yellow)
                                    .opacity(0.7)
                                    .frame(width: 347, height: 100)
                                    .overlay() {
                                        HStack {
                                            VStack {
                                                Spacer()
                                                HStack {
                                                    Text("\(fullyear)年 \(getdayofweeknow())")
                                                        .foregroundColor(.black)
                                                        .padding(.horizontal)
                                                }
                                                Text("\(month)月\(date)日 ")
                                                    .font(.title)
                                                    .bold()
                                                    .foregroundColor(.black)
                                                Spacer()


                                            }
                                            VStack {
                                                Text("今天")
                                                    .bold()
                                                    .font(.largeTitle)
                                                    .foregroundColor(.black)
                                                
                                                
                                            }
                                        }
                                    }
                                    
                            } else {
                                HStack {
                                    Rectangle()
                                        .foregroundColor(.black)
                                        .opacity(0.5)
                                        .frame(width: 70, height: 100)
                                        .overlay() {
                                            VStack {
                                                Text("\(correctdate(num: date))日")
                                                    .bold()
                                                    .foregroundColor(.black)
                                                Text(getdayofweeknow())
                                                    .font(.subheadline)
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
                                                if isnil() == true {
                                                    HStack {
                                                        Text("未編排任何活動")
                                                            .bold()
                                                            .foregroundColor(.black)
                                                        
                                                    }
                                                }
                                                if item1 != "" {
                                                    HStack {
                                                        Text(" · \(item1)")
                                                            .bold()
                                                            .foregroundColor(.black)
                                                        Spacer()
                                                    }
                                                }
                                                if item2 != "" {
                                                    HStack {
                                                        Text(" · \(item2)")
                                                            .bold()
                                                            .foregroundColor(.black)
                                                        Spacer()
                                                    }
                                                }
                                                if item3 != "" {
                                                    HStack {
                                                        Text(" · \(item3)")
                                                            .bold()
                                                            .foregroundColor(.black)
                                                        Spacer()
                                                    }
                                                }
                                                if item4 != "" {
                                                    HStack {
                                                        Text(" · \(item4)")
                                                            .bold()
                                                            .foregroundColor(.black)
                                                        Spacer()
                                                    }
                                                }
                                                
                                            }
                                        }
                                    
                                    Rectangle()
                                        .foregroundColor(.green)
                                        .opacity(0.5)
                                        .frame(width: 90, height: 100)
                                        .overlay() {
                                            ZStack {
                                                VStack {
                                                    HStack {
                                                        Spacer()
                                                        VStack {
                                                            if "\(Int(stringtofloat(string: cal1)+stringtofloat(string: cal2)+stringtofloat(string: cal3)+stringtofloat(string: cal4)))" == "" {
                                                                Text("0")
                                                                    .bold()
                                                                    .foregroundColor(.black)
                                                            } else {
                                                                Text("\(Int(stringtofloat(string: cal1)+stringtofloat(string: cal2)+stringtofloat(string: cal3)+stringtofloat(string: cal4)))")
                                                                    .bold()
                                                                    .foregroundColor(.black)
                                                                
                                                            }
                                                            Text("卡路里")
                                                                .bold()
                                                                .foregroundColor(.black)
                                                        }
                                                        Spacer()
                                                    }
                                                    
                                                }
                                                
                                                
                                                
                                            }
                                        }
                                }
                            }
                            
                            
                        }
                    }
                    
                }
            }
                
        }
        .preferredColorScheme(.light)
//        (isPresented: $popover,attachmentAnchor: .point(.center), arrowEdge: .trailing) {
        .sheet(isPresented: $popover) {
            NavigationView {
                ZStack {
                    VStack {
                        Spacer()
                            .frame(height: 5)
                        Color.white
                            .edgesIgnoringSafeArea(.all)
                    }
                    VStack {
                        VStack {
                            Rectangle()
                                .foregroundColor(.yellow)
                                .opacity(0.7)
                                .frame(height: 100)
                                .padding(.horizontal)
                                .overlay() {
                                    VStack {
                                        if today == true {
                                            VStack {
                                                Spacer()
                                                Text("\(NSLocalizedString("今天", comment: "今天")) (\(getdayofweeknow()))")
                                                    .foregroundColor(.black)
                                                    .font(.largeTitle)
                                                    .bold()
                                                
                                                Spacer()
                                            }
                                        } else if getrightdate() == getdatecom() {
                                            VStack {
                                                Spacer()
                                                Text("\(NSLocalizedString("今天", comment: "今天")) (\(getdayofweeknow()))")
                                                    .foregroundColor(.black)
                                                    .font(.largeTitle)
                                                    .bold()
                                                
                                                Spacer()
                                            }
                                            
                                        } else {
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
                                        
                                    }
                                    .frame(width:347)
                                    
                                    
                                }
                                .padding(.top)
                            Rectangle()
                                .foregroundColor(.blue)
                                .opacity(0.5)
                                .padding(.horizontal)
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
                                            if isnil() == true {
                                                HStack {
                                                    Text("未編排任何活動")
                                                        .font(.largeTitle)
                                                        .foregroundColor(.black)
                                                    
                                                }
                                            }
                                            if item1 != "" {
                                                HStack {
                                                    if cal1 != "" {
                                                        let n = cal1
                                                        let n2 = "\(item1) - \(n)cal"
                                                        Text(" · \(n2)")
                                                            .font(.largeTitle)
                                                            .foregroundColor(.black)
                                                            .onTapGesture(perform: {
                                                                popover = false
                                                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                                                                    itemeditdata1 = true
                                                                }
                                                            })
                                                    } else {
                                                        Text(" · \(item1)")
                                                            .font(.largeTitle)
                                                            .foregroundColor(.black)
                                                            .onTapGesture(perform: {
                                                                popover = false
                                                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                                                                    itemeditdata1 = true
                                                                }
                                                            })
                                                    }
                                                    
                                                }
                                                
                                            }
                                            if item2 != "" {
                                                HStack {
                                                    if cal2 != "" {
                                                        let n = cal2
                                                        let n2 = "\(item2) - \(n)cal"
                                                        Text(" · \(n2)")
                                                            .font(.largeTitle)
                                                            .foregroundColor(.black)
                                                            .onTapGesture(perform: {
                                                                popover = false
                                                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                                                                    itemeditdata2 = true
                                                                }
                                                            })
                                                    } else {
                                                        Text(" · \(item2)")
                                                            .font(.largeTitle)
                                                            .foregroundColor(.black)
                                                            .onTapGesture(perform: {
                                                                popover = false
                                                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                                                                    itemeditdata2 = true
                                                                }
                                                            })
                                                    }
                                                }
                                            }
                                            if item3 != "" {
                                                HStack {
                                                    if cal3 != "" {
                                                        let n = cal3
                                                        let n2 = "\(item3) - \(n)cal"
                                                        Text(" · \(n2)")
                                                            .font(.largeTitle)
                                                            .foregroundColor(.black)
                                                            .onTapGesture(perform: {
                                                                popover = false
                                                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                                                                    itemeditdata3 = true
                                                                }
                                                            })
                                                    } else {
                                                        Text(" · \(item3)")
                                                            .font(.largeTitle)
                                                            .foregroundColor(.black)
                                                            .onTapGesture(perform: {
                                                                popover = false
                                                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                                                                    itemeditdata3 = true
                                                                }
                                                            })
                                                    }
                                                }
                                            }
                                            if item4 != "" {
                                                HStack {
                                                    if cal4 != "" {
                                                        let n = cal4
                                                        let n2 = "\(item4) - \(n)cal"
                                                        Text(" · \(n2)")
                                                            .font(.largeTitle)
                                                            .foregroundColor(.black)
                                                            .onTapGesture(perform: {
                                                                popover = false
                                                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                                                                    itemeditdata4 = true
                                                                }
                                                            })
                                                    } else {
                                                        Text(" · \(item4)")
                                                            .font(.largeTitle)
                                                            .foregroundColor(.black)
                                                            .onTapGesture(perform: {
                                                                popover = false
                                                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                                                                    itemeditdata4 = true
                                                                }
                                                            })
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                        }
                    }
                }
                .navigationTitle("已編排")
                .navigationBarTitleDisplayMode(.inline)
                .interactiveDismissDisabled()
                .navigationBarItems(leading:
                Button("完成") {
                    popover = false
                    savealldata()
                },
                trailing: Button(action: {
                    calmem = ""
                    popover = false
                    itemeditdata = ""
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                        add = true
                    }
                }, label: {
                    Image(systemName: "plus")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .padding()
                }))
            }
        }
        .onAppear() {
            loadalldata()

        }
        .onAppear() {
            if let defaults = UserDefaults(suiteName: "hingtattsang.app.M3-UItra") {
                let lang = defaults.string(forKey: "AppleLanguages") ?? ""
                if lang == "zh-HK"{
                    cn = true
                } else if lang == "zh-Hant"{
                    cn = true
                } else if lang == "zh-Hans"{
                    cn = true
                } else {
                    cn = false
                }
            }
            
        }
        
    }
    func loadalldata() -> Void {
        if let defaults = UserDefaults(suiteName: "hingtattsang.app.M3-UItra") {
            let today = getrightdate()
            let formatter1 = DateFormatter()
            formatter1.dateFormat = "dd/MM/yyyy"
            let datedatanow = "\(formatter1.string(from: today))"
            let dataitem1 = defaults.string(forKey: "\(datedatanow)dataitem1")
            let dataitem2 = defaults.string(forKey: "\(datedatanow)dataitem2")
            let dataitem3 = defaults.string(forKey: "\(datedatanow)dataitem3")
            let dataitem4 = defaults.string(forKey: "\(datedatanow)dataitem4")
            let dataholiday = defaults.bool(forKey: "\(datedatanow)dataholiday")
            let datacal1 = defaults.string(forKey: "\(datedatanow)datacal1")
            let datacal2 = defaults.string(forKey: "\(datedatanow)datacal2")
            let datacal3 = defaults.string(forKey: "\(datedatanow)datacal3")
            let datacal4 = defaults.string(forKey: "\(datedatanow)datacal4")
            item1 = dataitem1 ?? ""
            item2 = dataitem2 ?? ""
            item3 = dataitem3 ?? ""
            item4 = dataitem4 ?? ""
            holiday = dataholiday
            cal1 = datacal1 ?? ""
            cal2 = datacal2 ?? ""
            cal3 = datacal3 ?? ""
            cal4 = datacal4 ?? ""
            lognow(message: "data loaded Cell:\(datedatanow)")
        }
    }
    func savealldata() -> Void {
        if let defaults = UserDefaults(suiteName: "hingtattsang.app.M3-UItra") {
            let today = getrightdate()
            let formatter1 = DateFormatter()
            formatter1.dateFormat = "dd/MM/yyyy"
            let datedatanow = "\(formatter1.string(from: today))"
            if item1 != "" {
                defaults.set(item1, forKey: "\(datedatanow)dataitem1")
            } else {
                defaults.removeObject(forKey: "\(datedatanow)dataitem1")
            }
            if item2 != "" {
                defaults.set(item2, forKey: "\(datedatanow)dataitem2")
            } else {
                defaults.removeObject(forKey: "\(datedatanow)dataitem2")
            }
            if item3 != "" {
                defaults.set(item3, forKey: "\(datedatanow)dataitem3")
            } else {
                defaults.removeObject(forKey: "\(datedatanow)dataitem3")
            }
            if item4 != "" {
                defaults.set(item4, forKey: "\(datedatanow)dataitem4")
            } else {
                defaults.removeObject(forKey: "\(datedatanow)dataitem4")
            }
            if holiday != false {
                defaults.set(holiday, forKey: "\(datedatanow)dataholiday")
            } else {
                defaults.removeObject(forKey: "\(datedatanow)dataholiday")
            }
            if cal1 != "" {
                defaults.set(cal1, forKey: "\(datedatanow)datacal1")
            } else {
                defaults.removeObject(forKey: "\(datedatanow)datacal1")
            }
            if cal2 != "" {
                defaults.set(cal2, forKey: "\(datedatanow)datacal2")
            } else {
                defaults.removeObject(forKey: "\(datedatanow)datacal3")
            }
            if cal3 != "" {
                defaults.set(cal3, forKey: "\(datedatanow)datacal3")
            } else {
                defaults.removeObject(forKey: "\(datedatanow)datacal3")
            }
            if cal4 != "" {
                defaults.set(cal4, forKey: "\(datedatanow)datacal4")
            } else {
                defaults.removeObject(forKey: "\(datedatanow)datacal4")
            }
            lognow(message: "data saved")
        }
        
    }
    
    func stringtofloat(string: String) -> Float {
        let numberFormatter = NumberFormatter()
        let number = numberFormatter.number(from: string)
        let numberFloatValue = number?.floatValue ?? 0
        return numberFloatValue
    }
    
    func getdayofweeknow() -> String {
        let datecorrect = correctdate(num: month)
        let datecorrectday = correctdate(num: date)
        let mem = getDayOfWeek("\(datecorrectday)/\(datecorrect)/\(fullyear)", format:"dd/MM/yyyy") ?? ""
        return mem
    }
    
    func getDayOfWeek(_ date:String, format: String) -> String? {
        
        let weekDays = [
            NSLocalizedString("星期日", comment: "星期日"),
            NSLocalizedString("星期一", comment: "星期一"),
            NSLocalizedString("星期二", comment: "星期二"),
            NSLocalizedString("星期三", comment: "星期三"),
            NSLocalizedString("星期四", comment: "星期四"),
            NSLocalizedString("星期五", comment: "星期五"),
            NSLocalizedString("星期六", comment: "星期六")
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
    
    func getdatecom() -> Date {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let string = "\(dateFormatter.string(from: date))"
        dateFormatter.dateFormat = "dd/MM/yyyy"
        dateFormatter.date(from: string)
        return dateFormatter.date(from: string) ?? Date()
    }
    
    func getrightdate() -> Date {
        let datecorrect = correctdate(num: month)
        let datecorrectday = correctdate(num: date)
                
        let string = "\(datecorrectday)/\(datecorrect)/\(fullyear)"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        dateFormatter.date(from: string)
        return dateFormatter.date(from: string) ?? Date()
    }
    
    func isnil() -> Bool {
        var boool = false
        if item1 == "" {
            if item2 == "" {
                if item3 == "" {
                    if item4 == "" {
                        boool = true
                    }
                }
            }
        }
        return boool
        
    }
    func counrnum() -> Int {
        var num = 0
        if item1 != "" {
            num = 1
        }
        if item2 != "" {
            num = 2
        }
        if item3 != "" {
            num = 4
        }
        if item4 != "" {
            num = 5
        }
        return num
    }
    func lognow(message: String){
        let today = Date()
        let hours   = (Calendar.current.component(.hour, from: today))
        let minutes = (Calendar.current.component(.minute, from: today))
        let seconds = (Calendar.current.component(.second, from: today))
        let formatter1 = DateFormatter()
        formatter1.dateFormat = "dd/MM/yyyy"
        let datedatanow = "\(formatter1.string(from: today))"
        NSLog("dateView: \(datedatanow) \(hours):\(minutes):\(seconds) - \(message)")
        
    }
    
}
