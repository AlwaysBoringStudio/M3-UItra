//
//  calendar.swift
//  M3 UItra
//
//  Created by HingTatTsang on 14/8/2022.
//

import SwiftUI

struct newcontentView: View {
    var body: some View {
        TabView {
            homeView()
                .tabItem {
                    Label("主頁", systemImage: "house")
                }
            secView()
                .tabItem {
                    Label("訓練", systemImage: "figure.walk")
                }
            thrView()
                .tabItem {
                    Label("日程表", systemImage: "calendar")
                }
            fouView()
                .tabItem {
                    Label("設定", systemImage: "command.circle")
                }
        }
    }
}

struct secView: View {
    @State var view = true
    var body: some View {
        NavigationView {
            ScrollView {
                HStack {
                    if view == true {
                        Rectangle()
                            .frame(width: 150, height: 50)
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
                            .frame(width: 150, height: 50)
                            .foregroundColor(.gray)
                            .cornerRadius(25)
                            .overlay() {
                                Text("訓練")
                            }
                            .onTapGesture {
                                view = true
                            }
                    }
                    if view == true {
                        Rectangle()
                            .frame(width: 150, height: 50)
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
                            .frame(width: 150, height: 50)
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
                if view == true {
                    praView()
                } else {
                    claView()
                }
                
                
            }
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct praView: View {
    // 訓練
    var body: some View {
        NavigationLink(destination: errorView()) {
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
        NavigationLink(destination: aiView()) {
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
        NavigationLink(destination: aiView()) {
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

struct errorView: View {
    var body: some View {
        Text("唔好咁天真, 邊有可能咁快做得完")
            .font(.largeTitle)
            .bold()
            .foregroundColor(.blue)
    }
}



struct thrView: View {
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Rectangle()
                        .foregroundColor(.yellow)
                        .opacity(0.7)
                        .frame(width: 250, height: 100)
                        .overlay() {
                            VStack {
                                Spacer()
                                HStack {
                                    Text("2022年")
                                        .padding(.horizontal)
                                    Spacer()
                                }
                                Text("8月11日")
                                    .font(.largeTitle)
                                    .bold()
                                Spacer()
                            }
                            
                        }
                    Rectangle()
                        .foregroundColor(.blue)
                        .opacity(0.5)
                        .frame(width: 90, height: 100)
                        .overlay() {
                            Text("是日課程")
                                .font(.title3)
                        }
                }
                HStack {
                    Rectangle()
                        .foregroundColor(.black)
                        .opacity(0.5)
                        .frame(width: 70, height: 100)
                        .overlay() {
                            Text("12日")
                                .bold()
                                .font(.title3)
                        }
                        
                    Rectangle()
                        .foregroundColor(.red)
                        .opacity(0.6)
                        .frame(width: 170, height: 100)
                        .overlay() {
                            VStack {
                                HStack {
                                    Text(" · Sit Up: 100")
                                        .bold()
                                    Spacer()
                                }
                                HStack {
                                    Text(" · Push Up: 100")
                                        .bold()
                                    Spacer()
                                }
                                
                            }
                        }
                    Rectangle()
                        .foregroundColor(.green)
                        .opacity(0.5)
                        .frame(width: 90, height: 100)
                        .overlay() {
                            VStack {
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
                HStack {
                    Rectangle()
                        .foregroundColor(.black)
                        .opacity(0.5)
                        .frame(width: 70, height: 100)
                        .overlay() {
                            Text("13日")
                                .bold()
                                .font(.title3)
                        }
                        
                    Rectangle()
                        .foregroundColor(.red)
                        .opacity(0.6)
                        .frame(width: 170, height: 100)
                        .overlay() {
                            VStack {
                                HStack {
                                    Text(" · Sit Up: 100")
                                        .bold()
                                    Spacer()
                                }
                                HStack {
                                    Text(" · Push Up: 100")
                                        .bold()
                                    Spacer()
                                }
                                
                            }
                        }
                    Rectangle()
                        .foregroundColor(.green)
                        .opacity(0.5)
                        .frame(width: 90, height: 100)
                        .overlay() {
                            VStack {
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
                HStack {
                    Rectangle()
                        .foregroundColor(.red)
                        .opacity(0.8)
                        .frame(width: 347, height: 100)
                        .overlay() {
                            VStack {
                                HStack {
                                    Text("14日  Holiday")
                                        .bold()
                                        .font(.largeTitle)
                                }
                                
                            }
                        }
                    
                }
                HStack {
                    Rectangle()
                        .foregroundColor(.black)
                        .opacity(0.5)
                        .frame(width: 70, height: 100)
                        .overlay() {
                            Text("15日")
                                .bold()
                                .font(.title3)
                        }
                        
                    Rectangle()
                        .foregroundColor(.red)
                        .opacity(0.6)
                        .frame(width: 170, height: 100)
                        .overlay() {
                            VStack {
                                HStack {
                                    Text(" · Sit Up: 100")
                                        .bold()
                                    Spacer()
                                }
                                HStack {
                                    Text(" · Push Up: 100")
                                        .bold()
                                    Spacer()
                                }
                                
                            }
                        }
                    Rectangle()
                        .foregroundColor(.green)
                        .opacity(0.5)
                        .frame(width: 90, height: 100)
                        .overlay() {
                            VStack {
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
                HStack {
                    Rectangle()
                        .foregroundColor(.black)
                        .opacity(0.5)
                        .frame(width: 70, height: 100)
                        .overlay() {
                            Text("16日")
                                .bold()
                                .font(.title3)
                        }
                        
                    Rectangle()
                        .foregroundColor(.red)
                        .opacity(0.6)
                        .frame(width: 170, height: 100)
                        .overlay() {
                            VStack {
                                HStack {
                                    Text(" · Sit Up: 100")
                                        .bold()
                                    Spacer()
                                }
                                HStack {
                                    Text(" · Push Up: 100")
                                        .bold()
                                    Spacer()
                                }
                                
                            }
                        }
                    Rectangle()
                        .foregroundColor(.green)
                        .opacity(0.5)
                        .frame(width: 90, height: 100)
                        .overlay() {
                            VStack {
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
                HStack {
                    Rectangle()
                        .foregroundColor(.black)
                        .opacity(0.5)
                        .frame(width: 70, height: 100)
                        .overlay() {
                            Text("17日")
                                .bold()
                                .font(.title3)
                        }
                        
                    Rectangle()
                        .foregroundColor(.red)
                        .opacity(0.6)
                        .frame(width: 170, height: 100)
                        .overlay() {
                            VStack {
                                HStack {
                                    Text(" · Sit Up: 100")
                                        .bold()
                                    Spacer()
                                }
                                HStack {
                                    Text(" · Push Up: 100")
                                        .bold()
                                    Spacer()
                                }
                                
                            }
                        }
                    Rectangle()
                        .foregroundColor(.green)
                        .opacity(0.5)
                        .frame(width: 90, height: 100)
                        .overlay() {
                            VStack {
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
                HStack {
                    Rectangle()
                        .foregroundColor(.black)
                        .opacity(0.5)
                        .frame(width: 70, height: 100)
                        .overlay() {
                            Text("18日")
                                .bold()
                                .font(.title3)
                        }
                        
                    Rectangle()
                        .foregroundColor(.red)
                        .opacity(0.6)
                        .frame(width: 170, height: 100)
                        .overlay() {
                            VStack {
                                HStack {
                                    Text(" · Sit Up: 100")
                                        .bold()
                                    Spacer()
                                }
                                HStack {
                                    Text(" · Push Up: 100")
                                        .bold()
                                    Spacer()
                                }
                                
                            }
                        }
                    Rectangle()
                        .foregroundColor(.green)
                        .opacity(0.5)
                        .frame(width: 90, height: 100)
                        .overlay() {
                            VStack {
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
        }
    }
}

struct fouView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: errorView()) {
                    HStack {
                        Image(systemName: "person")
                        Text("帳戶")
                    }
                }
                NavigationLink(destination: errorView()) {
                    HStack {
                        Image(systemName: "bell.circle")
                        Text("通知")
                    }
                }
                NavigationLink(destination: errorView()) {
                    HStack {
                        Image(systemName: "externaldrive")
                        Text("儲存空間")
                    }
                }
            }
            .navigationTitle("設定")
        }
    }
}

struct homeView: View {
    var body: some View {
        NavigationView {
            ScrollView {
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
        
    }
}

struct circleView: View {
    var name: String
    var color: Color
    var body: some View {
        Circle()
            .foregroundColor(color)
            .frame(width: 90, height: 90)
            .overlay() {
                Image(systemName: name)
                    .resizable()
                    .scaledToFit()
                    .padding()
            }
    }
}

struct calendar_Previews: PreviewProvider {
    static var previews: some View {
        newcontentView()
//        thrView()
    }
}
