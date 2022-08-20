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
    @State var showwelcome = false
    @State var username = ""
    @State var navtitle = "成就"
    @State var health = Float(0)
    @State var caltoday = Float(0)
    @State var reward = 0
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                ZStack {
                    // MARK: Reward
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
                HStack {
                    // MARK: 任務 Pie Chart
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
                                    VStack {VStack {
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
                                        Text("\(Int(caltoday))/2,000")
                                            .font(.title3)
                                        Text("卡路里")
                                            .font(.title3)
                                    }
                                }
                            }
                    }
                    
                }
                HStack {
                    // MARK: 心跳
                    VStack {
                        Image("rate")
                            .resizable()
                            .scaledToFit()
                        Text("心跳")
                            .font(.title)
                    }
                    // MARK: 卡路里 Bar Chart
                    VStack {
                        Image("bar")
                            .resizable()
                            .scaledToFit()
                        Text("卡路里")
                            .font(.title)
                    }
                    
                }
                
            }
            
            .navigationTitle(navtitle)

            
            
            .onAppear() {
                runwelcome()
                health = defaults.float(forKey: "health")
                caltoday = defaults.float(forKey: "caltoday")
                reward = defaults.integer(forKey: "reward")
            }
            
            
            
        }
        
        .navigationViewStyle(StackNavigationViewStyle())
        .frame(maxWidth: 700)
        
    }
    func runwelcome() -> Void {
        username = defaults.string(forKey: "username") ?? "USERNAME"
        showwelcome = defaults.bool(forKey: "showwelcome")
        if showwelcome == true {
            navtitle = "歡迎, \(username)"
        }
    }
    
    
   
}




struct homeView_Previews: PreviewProvider {
    static var previews: some View {
        homeView()
    }
}
