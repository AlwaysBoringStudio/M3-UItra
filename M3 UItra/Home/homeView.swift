//
//  homeView.swift
//  M3 UItra
//
//  Created by HingTatTsang on 15/8/2022.
//

import SwiftUI

struct homeView: View {
    let defaults = UserDefaults.standard
    @State var showwelcome = false
    @State var username = ""
    @State var navtitle = "成就"
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                ZStack {
                    // MARK: Reward
                    VStack {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                rewardView(number: 1)
                                rewardView(number: 2)
                                rewardView(number: 3)
                                rewardView(number: 4)
                                rewardView(number: 5)
                                rewardView(number: 6)
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                }
                HStack {
                    // MARK: 任務 Pie Chart
                    VStack {
                        Image("cal")
                            .resizable()
                            .scaledToFit()
                            .overlay() {
                                RingView(
                                    percentage: 0.9,
                                    backgroundColor: Color.moveRingBackground,
                                    startColor: Color.moveRingStartColor,
                                    endColor: Color.moveRingEndColor,
                                    thickness: Constants.mainRingThickness
                                )
                            }
                        Text("任務")
                            .font(.title)
                    }
                    // MARK: 卡路里
                    VStack {
                        Image("cal")
                            .resizable()
                            .scaledToFit()
                            .overlay() {
                                VStack {
                                    Text("今天")
                                        .font(.largeTitle)
                                    Text("570 cal")
                                        .font(.largeTitle)
                                    Text("卡路里")
                                        .font(.largeTitle)
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
