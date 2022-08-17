//
//  class.swift
//  M3 UItra
//
//  Created by HingTatTsang on 17/8/2022.
//

import SwiftUI

struct classView: View {
    @State var showAlert = false
    @State var text = String("")
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
                        TextField("代碼", text: $text)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.black)
                            .font(.title)
                    }.frame(maxWidth: 200)
                    Spacer()
                    Button(action: {
                        showAlert = true
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
            .alert("Your code is invalid !", isPresented: $showAlert, actions: {
                        Button("OK") { }
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
