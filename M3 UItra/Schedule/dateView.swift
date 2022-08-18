//
//  dateView.swift
//  M3 UItra
//
//  Created by HingTatTsang on 15/8/2022.
//

import SwiftUI

struct dateView: View {
    @State var date: String
    @State var itemnumber: Int
    @State var item1: String
    @State var item2: String
    @State var item3: String
    @State var item4: String
    @State var name: String
    @State var starttime: String
    @State var endtime: String
    @State var holiday: Bool
    
    @State var month: String
    @State var fullyear: String
    
    @State var popover = false
    var body: some View {
        VStack {
            if holiday == true {
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
                                    .foregroundColor(.black)
                            }
                            
                        }
                    }
            } else {
                Button(action: {
                    popover = true
                }) {
                    HStack {
                        Rectangle()
                            .foregroundColor(.black)
                            .opacity(0.5)
                            .frame(width: 70, height: 100)
                            .overlay() {
                                Text("\(date)日")
                                    .bold()
                                    .font(.title3)
                                    .foregroundColor(.black)
                            }
                            
                        Rectangle()
                            .foregroundColor(.red)
                            .opacity(0.6)
                            .frame(width: 170, height: 100)
                            .overlay() {
                                VStack {
                                    if itemnumber == 1 {
                                        HStack {
                                            Text(" · \(item1)")
                                                .bold()
                                                .foregroundColor(.black)
                                            Spacer()
                                        }
                                    } else if itemnumber == 2 {
                                        HStack {
                                            Text(" · \(item1)")
                                                .bold()
                                                .foregroundColor(.black)
                                            Spacer()
                                        }
                                        HStack {
                                            Text(" · \(item2)")
                                                .bold()
                                                .foregroundColor(.black)
                                            Spacer()
                                        }
                                    } else if itemnumber == 3 {
                                        HStack {
                                            Text(" · \(item1)")
                                                .bold()
                                                .foregroundColor(.black)
                                            Spacer()
                                        }
                                        HStack {
                                            Text(" · \(item2)")
                                                .bold()
                                                .foregroundColor(.black)
                                            Spacer()
                                        }
                                        HStack {
                                            Text(" · \(item3)")
                                                .bold()
                                                .foregroundColor(.black)
                                            Spacer()
                                        }
                                    } else if itemnumber == 4 {
                                        HStack {
                                            Text(" · \(item1)")
                                                .bold()
                                                .foregroundColor(.black)
                                            Spacer()
                                        }
                                        HStack {
                                            Text(" · \(item2)")
                                                .bold()
                                                .foregroundColor(.black)
                                            Spacer()
                                        }
                                        HStack {
                                            Text(" · \(item3)")
                                                .bold()
                                                .foregroundColor(.black)
                                            Spacer()
                                        }
                                        HStack {
                                            Text(" · \(item4)")
                                                .bold()
                                                .foregroundColor(.black)
                                            Spacer()
                                        }
                                    } else {
                                        Text("Error")
                                            .font(.largeTitle)
                                            .foregroundColor(.black)
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
                                        Text(" \(name)")
                                            .bold()
                                            .foregroundColor(.black)
                                        Spacer()
                                    }
                                    HStack {
                                        Text(" \(starttime)")
                                            .bold()
                                            .foregroundColor(.black)
                                        Spacer()
                                    }
                                    HStack {
                                        Text(" \(endtime)")
                                            .bold()
                                            .foregroundColor(.black)
                                        Spacer()
                                    }
                                    
                                    
                                }
                            }
                    }
                }
                
            }
                
        }
            .sheet(isPresented: $popover) {
                HStack {
                    Rectangle()
                        .foregroundColor(.yellow)
                        .opacity(0.7)
                        .frame(width: 250, height: 100)
                        .overlay() {
                            VStack {
                                Spacer()
                                HStack {
                                    Text("\(fullyear)年")
                                        .padding(.horizontal)
                                    Spacer()
                                }
                                Text("\(month)月\(date)日")
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
    }
}

struct dateView_Previews: PreviewProvider {
    static var previews: some View {
        dateView(date: "13", itemnumber: 2, item1: "Sit Up: 100", item2: "Sit Up: 100", item3: "", item4: "", name: "陳老師", starttime: "7:00 a.m.", endtime: "7:30 a.m.", holiday: false, month: "8", fullyear: "2022")
    }
}
