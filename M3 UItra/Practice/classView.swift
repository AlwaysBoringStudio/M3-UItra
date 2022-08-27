//
//  class.swift
//  M3 UItra
//
//  Created by HingTatTsang on 17/8/2022.
//

import SwiftUI
import WebKit

struct classView: View {
    @State var showAlert = false
    @State var text = String("")
    @State var view1 = false
    @State var lesson = false
    var body: some View {
        // MARK: 連接課堂
        Group {
            if lesson == true {
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
                                            .padding(25)
                                        Spacer()
                                    }
                                }
                                
                            }
                        }
                }
            } else {
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
                                .font(.title3)
                                .bold()
                            Spacer()
                            HStack {
                                TextField("代碼", text: $text)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.black)
                                    .font(.title)
                            }.frame(maxWidth: 200)
                            Spacer()
                            Button(action: {
                                if text == "LKCSS" {
                                    lesson = true
                                } else {
                                    showAlert = true
                                }
                            }, label: {
                                Rectangle()
                                    .frame(width: 150, height: 50)
                                    .foregroundColor(.white)
                                    .cornerRadius(25)
                                    .overlay() {
                                        Text("連接")
                                            .font(.title)
                                            .bold()
                                    }
                            })
                            Spacer()
                        }
                    }
            }
        }
        .fullScreenCover(isPresented: $view1) {
            NavigationView {
                aiView()
                    .navigationTitle("掌上壓")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar() {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button(action: {
                                view1 = false
                            }, label: {
                                Text("退出")
                            })
                        }
                    }
            }
        }
        
        // MARK: if error
        // if error run "showAlert = true"
            .alert("代碼無效 !", isPresented: $showAlert, actions: {
                        Button("返回") { }
            })
    }
    
}


struct classView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            classView()
        }
    }
}
