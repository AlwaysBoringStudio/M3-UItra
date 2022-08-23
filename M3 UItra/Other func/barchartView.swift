//
//  barchartView.swift
//  M3 UItra
//
//  Created by HingTatTsang on 22/8/2022.
//

import SwiftUI

struct barchartView: View {
    @State var data: Float
    @State var per: Float
    @State var size = Float(1.6)
    @State var small = Float(10)
    @State var text = false
    var body: some View {
        if data > 1500 {
            HStack {
                VStack {
                    VStack {
                        ZStack {
                            VStack {
                                Spacer()
                                Rectangle()
                                    .foregroundColor(.green)
                                    .opacity(0)
                                    .frame(width: 20*CGFloat(size), height: CGFloat(per)/CGFloat(small))
                            }
                            ZStack {
                                VStack {
                                    Spacer()
                                    Rectangle()
                                        .foregroundColor(.red)
                                        .frame(width: 20*CGFloat(size), height: CGFloat(data)/CGFloat(small))
                                }
                                if text == true {
                                    VStack {
                                        Spacer()
                                        Text("今")
                                            .foregroundColor(.blue)
                                            .padding(.top)
                                        Text("天")
                                            .foregroundColor(.blue)
                                            .padding(.bottom)
                                    }
                                }
                            }
                        }
                        
                    }
                    .frame(height: CGFloat(per)/CGFloat(small))
                    Text("\(Int(data))")
                }
            }
            .padding(3)
        } else {
            HStack {
                VStack {
                    VStack {
                        ZStack {
                            VStack {
                                Spacer()
                                Rectangle()
                                    .foregroundColor(.green)
                                    .opacity(0)
                                    .frame(width: 20*CGFloat(size), height: CGFloat(per)/CGFloat(small))
                            }
                            ZStack {
                                VStack {
                                    Spacer()
                                    Rectangle()
                                        .frame(width: 20*CGFloat(size), height: CGFloat(data)/CGFloat(small))
                                }
                                if text == true {
                                    VStack {
                                        Spacer()
                                        Text("今")
                                            .foregroundColor(.blue)
                                            .padding(.top)
                                        Text("天")
                                            .foregroundColor(.blue)
                                            .padding(.bottom)
                                    }
                                }
                            }
                        }
                        
                    }
                    .frame(height: CGFloat(per)/CGFloat(small))
                    Text("\(Int(data))")
                }
            }
            .padding(3)
        }
    }
}

struct barchartView_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            barchartView(data: 200, per: 2000, text: true)
            barchartView(data: 500, per: 2000, text: true)
            barchartView(data: 900, per: 2000, text: true)
            barchartView(data: 1200, per: 2000, text: true)
            barchartView(data: 1600, per: 2000, text: true)
            barchartView(data: 2000, per: 2000, text: true)
        }
    }
}
