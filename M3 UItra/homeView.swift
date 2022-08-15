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
                                circleView(name: "heart", color: .pink)
                                circleView(name: "lungs", color: .green)
                                circleView(name: "figure.walk", color: .yellow)
                                circleView(name: "flame.fill", color: .blue)
                                circleView(name: "bolt.heart.fill", color: .green)
                                circleView(name: "star",color: .pink)
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
        
    }
}


struct homeView_Previews: PreviewProvider {
    static var previews: some View {
        homeView()
    }
}
