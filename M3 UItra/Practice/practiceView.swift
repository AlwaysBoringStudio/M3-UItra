//
//  practiceView.swift
//  M3 UItra
//
//  Created by HingTatTsang on 15/8/2022.
//

import SwiftUI

// MARK: This View Just For Button

struct practiceView: View {
    @State var view = true
    @State var size = CGFloat(160)
    var body: some View {
        ZStack {
            NavigationView {
                ScrollView {
                    if view == true {
                        trainView()
                    } else {
                        classView()
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
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
        .navigationViewStyle(.stack)
        
    }
}



struct practiceView_Preview: PreviewProvider {
    static var previews: some View {
        practiceView()
    }
}

