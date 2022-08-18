//
//  todayView.swift
//  M3 UItra
//
//  Created by HingTatTsang on 18/8/2022.
//

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
                                            VStack {
                                                Spacer()
                                                HStack {
                                                    Text("\(nowdate(format: "yyyy"))年")
                                                        .foregroundColor(.black)
                                                        .padding(.horizontal)
                                                    Spacer()
                                                }
                                                Text("\(nowdate(format: "MM"))月\(nowdate(format: "dd"))日")
                                                    .font(.largeTitle)
                                                    .bold()
                                                    .foregroundColor(.black)
                                                Spacer()
                                                
                                            }
                                            
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
}



struct todayView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
            todayView(year: "2022", month: "08")
        }
        
    }
}
