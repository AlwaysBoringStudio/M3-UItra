//
//  practiceView.swift
//  M3 UItra
//
//  Created by HingTatTsang on 15/8/2022.
//

import SwiftUI

// MARK: 訓練頁面的控制器
struct practiceView: View {
    @State var view = true
    @State var size = CGFloat(160)
    var body: some View {
        ZStack {
            NavigationView {
                ScrollView(showsIndicators: false) {
                    if view == true {
                        trainView()
                    } else {
                        classView()
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
            }
            ZStack {
                VStack {
                    Color.white
                        .frame(height: 110)
                        .opacity(0.9)
                        .ignoresSafeArea(.all)
                    Spacer()
                }
                VStack {
                    Color.gray
                        .frame(height: 110)
                        .opacity(0.5)
                        .ignoresSafeArea(.all)
                    Spacer()
                }
                VStack {
                    // MARK: 訓練 Button
                    HStack {
                        if view == true {
                            Rectangle()
                                .frame(width: size, height: 35)
                                .foregroundColor(.blue)
                                .cornerRadius(25)
                                .overlay() {
                                    Text("訓練")
                                        .bold()
                                }
                                .onTapGesture {
                                    view = true
                                }
                        } else {
                            Rectangle()
                                .frame(width: size, height: 35)
                                .foregroundColor(.gray)
                                .cornerRadius(25)
                                .overlay() {
                                    Text("訓練")
                                }
                                .onTapGesture {
                                    view = true
                                }
                        }
                        Spacer()
                        // MARK: 課程 Button
                        if view == true {
                            Rectangle()
                                .frame(width: size, height: 35)
                                .foregroundColor(.gray)
                                .cornerRadius(25)
                                .overlay() {
                                    Text("課程")
                                        
                                }
                                .onTapGesture {
                                    view = false
                                }
                        } else {
                            Rectangle()
                                .frame(width: size, height: 35)
                                .foregroundColor(.blue)
                                .cornerRadius(25)
                                .overlay() {
                                    Text("課程")
                                        .bold()
                                }
                                .onTapGesture {
                                    view = false
                                }
                        }
                        
                        
                    }
                    Spacer()
                }
                .frame(width: 340)
            }
                
            
        }
        .navigationViewStyle(.stack)
        
    }
}



struct practiceView_Preview: PreviewProvider {
    static var previews: some View {
        practiceView()
    }
}

