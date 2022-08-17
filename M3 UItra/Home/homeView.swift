//
//  homeView.swift
//  M3 UItra
//
//  Created by HingTatTsang on 15/8/2022.
//

import SwiftUI

struct homeView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                ZStack {
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
                    VStack {
                        Image("pie")
                            .resizable()
                            .scaledToFit()
                        Text("任務")
                            .font(.title)
                    }
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
                    VStack {
                        Image("rate")
                            .resizable()
                            .scaledToFit()
                        Text("心跳")
                            .font(.title)
                    }
                    VStack {
                        Image("bar")
                            .resizable()
                            .scaledToFit()
                        Text("卡路里")
                            .font(.title)
                    }
                    
                }
            }
            .navigationTitle("成就")
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .frame(maxWidth: 800)
        
    }
}




struct homeView_Previews: PreviewProvider {
    static var previews: some View {
        homeView()
    }
}
