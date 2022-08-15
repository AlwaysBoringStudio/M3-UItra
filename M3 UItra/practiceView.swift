//
//  practiceView.swift
//  M3 UItra
//
//  Created by HingTatTsang on 15/8/2022.
//

import SwiftUI

struct practiceView: View {
    @State var view = true
    @State var size = CGFloat(160)
    var body: some View {
        ZStack {
            NavigationView {
                ScrollView {
                    
                    if view == true {
                        praView()
                    } else {
                        claView()
                    }
                    
                }
                .navigationBarTitleDisplayMode(.inline)
            }
            VStack {
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
            }.frame(width: 340)
            
        }
        
    }
}

struct praView: View {
    @State var view1 = false
    @State var view2 = false
    @State var view3 = false
    // 訓練
    var body: some View {
        Button(action: {
            view3 = true
        }) {
            Rectangle()
                .frame(width: 340, height: 50)
                .foregroundColor(.purple)
                .cornerRadius(15)
                .padding()
                .overlay() {
                    ZStack {
                        HStack {
                            Text("可選項目")
                                .foregroundColor(.black)
                                .font(.title)
                                .bold()
                        }
                        HStack {
                            Spacer()
                            Image(systemName: "line.3.horizontal")
                                .resizable()
                                .foregroundColor(.black)
                                .frame(width: 25, height: 25)
                                .padding()
                            Spacer()
                                .frame(width: 15, height: 50)
                        }
                    }
                }
        }
        Button(action: {
            view1 = true
        }) {
            Image("push")
                .resizable()
                .frame(width: 340, height: 240)
                .foregroundColor(.pink)
                .cornerRadius(15)
                .padding()
                .overlay() {
                    ZStack {
                        VStack {
                            Spacer()
                            HStack {
                                Text("掌上壓")
                                    .foregroundColor(.white)
                                    .font(.title)
                                    .bold()
                                    .padding()
                                Spacer()
                            }
                        }
                        
                    }
                }
        }
        Button(action: {
            view2 = true
        }) {
            Image("pull")
                .resizable()
                .frame(width: 340, height: 240)
                .foregroundColor(.pink)
                .cornerRadius(15)
                .padding()
                .overlay() {
                    ZStack {
                        VStack {
                            Spacer()
                            HStack {
                                Text("仰臥起坐")
                                    .foregroundColor(.white)
                                    .font(.title)
                                    .bold()
                                    .padding()
                                Spacer()
                            }
                        }
                        
                    }
                }
        }
        
        .sheet(isPresented: $view1) {
            aiView()
        }
        .sheet(isPresented: $view2) {
            aiView()
        }
        .sheet(isPresented: $view3) {
            errorView()
        }
        
    }
}

struct claView: View {
    // 課程
    @State var text = String("H7J7F8")
    var body: some View {
        Rectangle()
            .frame(width: 340, height: 500)
            .foregroundColor(.green)
            .cornerRadius(15)
            .padding()
            .overlay() {
                VStack {
                    Spacer()
                    Text("輸入課堂連接代碼")
                        .foregroundColor(.black)
                        .font(.title)
                        .bold()
                    Spacer()
                    HStack {
                        Text("代碼: ")
                            .foregroundColor(.black)
                            .font(.title)
                            .bold()
                        Text("\(text)")
                            .underline()
                            .foregroundColor(.black)
                            .font(.title)
                            .bold()
                    }
                    Spacer()
                    Rectangle()
                        .frame(width: 150, height: 50)
                        .foregroundColor(.white)
                        .cornerRadius(25)
                        .overlay() {
                            Text("連接")
                                .font(.title)
                                .bold()
                        }
                    Spacer()
                }
            }
    }
}


struct practiceView_Preview: PreviewProvider {
    static var previews: some View {
        practiceView()
    }
}

struct practiceView_Preview_2: PreviewProvider {
    static var previews: some View {
        ScrollView {
            praView()
        }
    }
}


struct practiceView_Preview_3: PreviewProvider {
    static var previews: some View {
        ScrollView {
            claView()
        }
    }
}

