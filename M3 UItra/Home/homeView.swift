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
    @State var navtitle = "成就"
    @State var health = Float(0)
    @State var caltoday = Float(0)
    @State var reward = 0
    @State var message = 0
    @State var cal1 = ""
    @State var cal2 = ""
    @State var cal3 = ""
    @State var cal4 = ""
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                // MARK: Reward
                ZStack {
                    VStack {
                        if reward != 0 {
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    if reward == 1 {
                                        rewardView(number: 1)
                                    } else if reward == 2 {
                                        rewardView(number: 1)
                                        rewardView(number: 2)
                                    } else if reward == 3 {
                                        rewardView(number: 1)
                                        rewardView(number: 2)
                                        rewardView(number: 3)
                                    } else if reward == 4 {
                                        rewardView(number: 1)
                                        rewardView(number: 2)
                                        rewardView(number: 3)
                                        rewardView(number: 4)
                                    } else if reward == 5 {
                                        rewardView(number: 1)
                                        rewardView(number: 2)
                                        rewardView(number: 3)
                                        rewardView(number: 4)
                                        rewardView(number: 5)
                                    } else if reward == 6 {
                                        rewardView(number: 1)
                                        rewardView(number: 2)
                                        rewardView(number: 3)
                                        rewardView(number: 4)
                                        rewardView(number: 5)
                                        rewardView(number: 6)
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
                // MARK: 任務 Pie Chart
                HStack {
                    VStack {
                        Image("cal")
                            .resizable()
                            .scaledToFit()
                            .overlay() {
                                ZStack {
                                    RingView(
                                        percentage: Double(health),
                                        backgroundColor: Color.moveRingBackground,
                                        startColor: Color.moveRingStartColor,
                                        endColor: Color.moveRingEndColor,
                                        thickness: Constants.mainRingThickness
                                    )
                                    VStack {
                                        Text("今天")
                                            .font(.title3)
                                        Text("\(Int(health*100))%")
                                            .font(.title3)
                                        Text("任務")
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
                                    RingView(
                                        percentage: Double(caltoday/2000),
                                        backgroundColor: Color.exerciseRingBackground,
                                        startColor: Color.exerciseRingStartColor,
                                        endColor: Color.exerciseRingEndColor,
                                        thickness: Constants.mainRingThickness
                                    )
                                    VStack {
                                        Text("今天")
                                            .font(.title3)
                                        Text("\(Int(loadcaldata()))/2,000")
                                            .font(.title3)
                                        Text("卡路里")
                                            .font(.title3)
                                    }
                                }
                            }
                    }
                    
                }
                
                HStack {
                    // MARK: 七天的卡路里圖表
                    calchartView()
                }
                debugbutton()
            }
            // MARK: 標題
            .navigationTitle(navtitle)

            
            // MARK: 載入數據
            .onAppear() {
                runwelcome()
                health = loadcaldata()/2000
                caltoday = loadcaldata()
                reward = defaults.integer(forKey: "reward")
                
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
                        navtitle = "已完成\(Int(health*100))%任務"
                        printnow(message: "已完成\(Int(health*100))%任務")
                    } else if message == 3 {
                        navtitle = "已消耗\(Int(caltoday))卡路里"
                        printnow(message: "已消耗\(Int(caltoday))卡路里")
                    }
                }
            }
            
            
            
        }
        
        .navigationViewStyle(StackNavigationViewStyle())
        .frame(maxWidth: 700)
        
    }
    // MARK: 刷新數據
    func loadcaldata() -> Float {
        printnow(message: "loadcaldata()")
        let today = Date()
        let formatter1 = DateFormatter()
        formatter1.dateFormat = "dd/MM/yyyy"
        let datedatanow = "\(formatter1.string(from: today))"
        let sum1 = stringtofloat(string: "\(defaults.string(forKey: "\(datedatanow)datacal1") ?? "")")
        let sum2 = stringtofloat(string: "\(defaults.string(forKey: "\(datedatanow)datacal2") ?? "")")
        let sum3 = stringtofloat(string: "\(defaults.string(forKey: "\(datedatanow)datacal3") ?? "")")
        let sum4 = stringtofloat(string: "\(defaults.string(forKey: "\(datedatanow)datacal4") ?? "")")
        let datacal = String(sum1+sum2+sum3+sum4)
        let loaddata = datacal
        return Float(loaddata) ?? 0
    }
    // MARK: 檢查是否有在設定中打開"歡迎訊息"
    func runwelcome() -> Void {
        printnow(message: "runwelcome()")
        username = defaults.string(forKey: "username") ?? "USERNAME"
        showwelcome = defaults.bool(forKey: "showwelcome")
        if showwelcome == true {
            navtitle = "歡迎, \(username)"
        }
    }
    func stringtofloat(string: String) -> Float {
        let numberFormatter = NumberFormatter()
        let number = numberFormatter.number(from: string)
        let numberFloatValue = number?.floatValue ?? 0
        return numberFloatValue
    }

    func printnow(message: String){
        let today = Date()
        let hours   = (Calendar.current.component(.hour, from: today))
        let minutes = (Calendar.current.component(.minute, from: today))
        let seconds = (Calendar.current.component(.second, from: today))
        let formatter1 = DateFormatter()
        formatter1.dateFormat = "dd/MM/yyyy"
        let datedatanow = "\(formatter1.string(from: today))"
        print("homeView: \(datedatanow) \(hours):\(minutes):\(seconds) - \(message)")
        
    }
    
}



struct homeView_Previews: PreviewProvider {
    static var previews: some View {
        homeView()
    }
}
