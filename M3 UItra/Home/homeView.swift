//
//  homeView.swift
//  M3 UItra
//
//  Created by HingTatTsang on 15/8/2022.
//

import SwiftUI
import Combine

struct homeView: View {
    let defaults = UserDefaults.standard
    let timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    @State var showwelcome = false
    @State var username = ""
    @State var navtitle = NSLocalizedString("成就", comment: "成就")
    @State var health = Float(0)
    @State var caltoday = Float(0)
    @State var reward = 0
    @State var message = 0
    @State var cal1 = ""
    @State var cal2 = ""
    @State var cal3 = ""
    @State var cal4 = ""
    @State var showdate = false
    @State var water = Double(0)
    var body: some View {
        NavigationView {
            VStack {
                ScrollView(showsIndicators: false) {
                    // MARK: Reward
                    ZStack {
                        VStack {
                            if reward != 0 {
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack {
                                        ForEach((1...reward), id: \.self) { i in
                                            rewardView(number: i)
                                        }
                                    }
                                }
                                .padding(.horizontal)
                            } else {
                                Text("獎勵將顯示在這裡...")
                                    .font(.system(size: 30))
                                    .frame(height: 120)
                                    .padding(.horizontal)
                            }
                            
                        }
                        
                    }
                    if showdate == true {
                        todayView(year: "", month: "", istoday: true, home: true)
                    }
                    if UIDevice.current.systemVersion.contains("16") == true {
                        ZStack {
                            Rectangle()
                                .cornerRadius(25)
                                .foregroundColor(.white)
                                .frame(height: 140)
                                .padding()
                            Rectangle()
                                .cornerRadius(25)
                                .foregroundColor(.yellow)
                                .opacity(0.7)
                                .frame(height: 140)
                                .padding()
                                .overlay() {
                                    ZStack {
                                        waterView(percent: $water)
                                            .mask(Rectangle().cornerRadius(25).foregroundColor(.yellow).opacity(0.7).frame(height: 140).padding())
                                        if caltoday >= 2000 {
                                            Rectangle().cornerRadius(25).foregroundColor(.green).frame(height: 140).padding()
                                        }
                                        tworing
                                    }
                                }
                                .onAppear() {
                                    water = Double((caltoday/2000)*100)
                                    let newwater = Double(water)
                                    printnow(message: "\(newwater)")
                                }
                        }
                            .environment(\.colorScheme, .light)
                    } else {
                        tworing
                    }
                    // MARK: 七天的卡路里圖表
                    HStack {
                        calchartView()
                    }
                }
                
                
                // MARK: 標題
                .navigationTitle(navtitle)

                
                // MARK: 載入數據
                .onAppear() {
                    #if DEBUG
                    debug()
                    #endif
                    runwelcome()
                    health = loadcaldata()/2000
                    caltoday = loadcaldata()
                    reward = getdata().getdefaultsdataint(type: "reward")
                    showdateload()
                    
                }
                // MARK: 自動更變標題文字
                .onReceive(timer) { input in
                    if showwelcome == true {
                        if message != 3 {
                            message = message+1
                        } else {
                            message = 1
                        }
                        if message == 1 {
                            runwelcome()
                            printnow(message: "歡迎, \(username)")
                        } else if message == 2{
                            navtitle = "\(NSLocalizedString("已完成", comment: "已完成"))\(Int(health*100))\(NSLocalizedString("%任務", comment: "%任務"))"
                            printnow(message: "已完成\(Int(health*100))%任務")
                        } else if message == 3 {
                            navtitle = "\(NSLocalizedString("已消耗", comment: "已消耗")) \(Int(caltoday)) \(NSLocalizedString("卡路里", comment: "卡路里"))"
                            printnow(message: "已消耗 \(Int(caltoday)) 卡路里")
                        }
                    }
                }
            }
        }
        
        .navigationViewStyle(StackNavigationViewStyle())
        .frame(maxWidth: 700)
        
    }
    var tworing: some View {
        // MARK: 任務 Pie Chart
        HStack {
            VStack {
                Image("cal")
                    .resizable()
                    .scaledToFit()
                    .overlay() {
                        ZStack {
                            if UIDevice.current.systemVersion.contains("16") != true {
                                RingView(
                                    percentage: Double(health),
                                    backgroundColor: Color.moveRingBackground,
                                    startColor: Color.moveRingStartColor,
                                    endColor: Color.moveRingEndColor,
                                    thickness: Constants.mainRingThickness
                                )
                            }
                            
                            VStack {
                                Text("今天")
                                    .foregroundColor(.black)
                                    .font(.title3)
                                Text("\(Int(health*100))%")
                                    .foregroundColor(.black)
                                    .font(.title3)
                                Text("任務")
                                    .foregroundColor(.black)
                                    .font(.title3)
                            }
                        }
                    }
               
            }
            // MARK: 卡路里
            VStack {
                Image("cal")
                    .resizable()
                    .scaledToFit()
                    .overlay() {
                        ZStack {
                            if UIDevice.current.systemVersion.contains("16") != true {
                                RingView(
                                    percentage: Double(caltoday/2000),
                                    backgroundColor: Color.exerciseRingBackground,
                                    startColor: Color.exerciseRingStartColor,
                                    endColor: Color.exerciseRingEndColor,
                                    thickness: Constants.mainRingThickness
                                )
                            }
                            VStack {
                                Text("今天")
                                    .foregroundColor(.black)
                                    .font(.title3)
                                Text("\(Int(loadcaldata()))/2,000")
                                    .foregroundColor(.black)
                                    .font(.title3)
                                Text("卡路里")
                                    .foregroundColor(.black)
                                    .font(.title3)
                            }
                        }
                    }
            }
            
        }
    }
    // MARK: 刷新數據
    func loadcaldata() -> Float {
        printnow(message: "loadcaldata()")
        let today = Date()
        let formatter1 = DateFormatter()
        formatter1.dateFormat = "yyyy-MM-dd"
        let datedatanow = "\(formatter1.string(from: today))"
        let sum1 = stringtofloat(string: getdata().getdata(date: datedatanow, datanum: 5))
        let sum2 = stringtofloat(string: getdata().getdata(date: datedatanow, datanum: 6))
        let sum3 = stringtofloat(string: getdata().getdata(date: datedatanow, datanum: 7))
        let sum4 = stringtofloat(string: getdata().getdata(date: datedatanow, datanum: 8))
        let datacal = String(sum1+sum2+sum3+sum4)
        let loaddata = datacal
        return Float(loaddata) ?? 0
    }
    func showdateload() -> Void {
        printnow(message: "loadcaldata()")
        let today = Date()
        let formatter1 = DateFormatter()
        formatter1.dateFormat = "dd/MM/yyyy"
        let datedatanow = "\(formatter1.string(from: today))"
        let datamem = defaults.string(forKey: "\(datedatanow)dataitem1")
        if datamem == nil {
            showdate = false
        } else {
            showdate = true
        }
        
    }
    
    // MARK: 檢查是否有在設定中打開"歡迎訊息"
    func runwelcome() -> Void {
        printnow(message: "runwelcome()")
        username = defaults.string(forKey: "username") ?? "USERNAME"
        showwelcome = defaults.bool(forKey: "showwelcome")
        if showwelcome == true {
            navtitle = "\(NSLocalizedString("歡迎", comment: "歡迎")), \(username)"
        }
    }
    func stringtofloat(string: String) -> Float {
        let numberFormatter = NumberFormatter()
        let number = numberFormatter.number(from: string)
        let numberFloatValue = number?.floatValue ?? 0
        return numberFloatValue
    }

    func printnow(message: String) {
        let today = Date()
        let hours   = (Calendar.current.component(.hour, from: today))
        let minutes = (Calendar.current.component(.minute, from: today))
        let seconds = (Calendar.current.component(.second, from: today))
        let formatter1 = DateFormatter()
        formatter1.dateFormat = "dd/MM/yyyy"
        let datedatanow = "\(formatter1.string(from: today))"
        NSLog("homeView: \(datedatanow) \(hours):\(minutes):\(seconds) - \(message)")
        
    }
    #if DEBUG
    func notify() -> Void {
        let content = UNMutableNotificationContent()
        content.title = "DEBUG"
        content.body = "Debug mode turned on."
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 0.1, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)

        NSLog("All set!")
    }
    func debug() -> Void {
        let dictionary = defaults.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            defaults.removeObject(forKey: key)
        }
        defaults.set(Int(6), forKey: "reward")
        defaults.set(String("John Appleseed"), forKey: "username")
        defaults.set(String(""), forKey: "firstopen")
        defaults.set(Bool(true), forKey: "showwelcome")
        defaults.set(Bool(false), forKey: "notifyon")
        for i in 0...366 {
            let int = Int.random(in: 1...3)
            if int == 1 {
                otherdata(datatoday: yesterDay(pre: i), datainfo: "dataitem1", datastring: "跳高")
                otherdata(datatoday: yesterDay(pre: i), datainfo: "dataitem2", datastring: "跳繩")
                otherdata(datatoday: yesterDay(pre: i), datainfo: "datacal1", datastring: "170")
                otherdata(datatoday: yesterDay(pre: i), datainfo: "datacal2", datastring: "240")
            } else if int == 2 {
                otherdata(datatoday: yesterDay(pre: i), datainfo: "dataitem1", datastring: "跳高")
                otherdata(datatoday: yesterDay(pre: i), datainfo: "dataitem2", datastring: "跳繩")
                otherdata(datatoday: yesterDay(pre: i), datainfo: "dataitem3", datastring: "滑板")
                otherdata(datatoday: yesterDay(pre: i), datainfo: "datacal1", datastring: "170")
                otherdata(datatoday: yesterDay(pre: i), datainfo: "datacal2", datastring: "240")
                otherdata(datatoday: yesterDay(pre: i), datainfo: "datacal3", datastring: "400")
            } else if int == 3 {
                otherdata(datatoday: yesterDay(pre: i), datainfo: "dataitem1", datastring: "跳高")
                otherdata(datatoday: yesterDay(pre: i), datainfo: "dataitem2", datastring: "跳繩")
                otherdata(datatoday: yesterDay(pre: i), datainfo: "dataitem3", datastring: "滑板")
                otherdata(datatoday: yesterDay(pre: i), datainfo: "datacal1", datastring: "170")
                otherdata(datatoday: yesterDay(pre: i), datainfo: "datacal2", datastring: "240")
                otherdata(datatoday: yesterDay(pre: i), datainfo: "datacal3", datastring: "400")
            }
        }
        for i in 0...366 {
            let int = Int.random(in: 1...4)
            if int == 1 {
                otherdata(datatoday: folDay(pre: i), datainfo: "dataitem1", datastring: "跳高")
                otherdata(datatoday: folDay(pre: i), datainfo: "dataitem2", datastring: "跳繩")
                otherdata(datatoday: folDay(pre: i), datainfo: "datacal1", datastring: "170")
                otherdata(datatoday: folDay(pre: i), datainfo: "datacal2", datastring: "240")
            } else if int == 2 {
                otherdata(datatoday: folDay(pre: i), datainfo: "dataitem1", datastring: "跳高")
                otherdata(datatoday: folDay(pre: i), datainfo: "dataitem2", datastring: "跳繩")
                otherdata(datatoday: folDay(pre: i), datainfo: "dataitem3", datastring: "滑板")
                otherdata(datatoday: folDay(pre: i), datainfo: "datacal1", datastring: "170")
                otherdata(datatoday: folDay(pre: i), datainfo: "datacal2", datastring: "240")
                otherdata(datatoday: folDay(pre: i), datainfo: "datacal3", datastring: "400")
            } else if int == 3 {
                otherdata(datatoday: folDay(pre: i), datainfo: "dataitem1", datastring: "跳繩")
                otherdata(datatoday: folDay(pre: i), datainfo: "datacal1", datastring: "240")
            }
        }
        notify()
    }
    func yesterDay(pre: Int) -> Date {
        var dayComponent = DateComponents()
        dayComponent.day = Int(String("-\(Int(pre))"))
        let calendar = Calendar.current
        let nextDay =  calendar.date(byAdding: dayComponent, to: Date())!
        return nextDay
    }
    func folDay(pre: Int) -> Date {
        var dayComponent = DateComponents()
        dayComponent.day = Int(String("\(Int(pre))"))
        let calendar = Calendar.current
        let nextDay =  calendar.date(byAdding: dayComponent, to: Date())!
        return nextDay
    }
    func otherdata(datatoday: Date, datainfo: String, datastring: String) -> Void {
        let today = datatoday
        let formatter1 = DateFormatter()
        formatter1.dateFormat = "dd/MM/yyyy"
        let datedatanow = "\(formatter1.string(from: today))"
        defaults.set(datastring, forKey: "\(datedatanow)\(datainfo)")
    }
    #endif
    
}



struct homeView_Previews: PreviewProvider {
    static var previews: some View {
        homeView()
    }
}
