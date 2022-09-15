//
//  rewardView.swift
//  M3 UItra
//
//  Created by HingTatTsang on 17/8/2022.
//

import SwiftUI

struct rewardView: View {
    var number = 1
    let name = ["生命於心跳", "鐵肺", "步行者", "烈火戰士", "瘋狂心臟", "摘星者"]
    let systemname = ["heart", "lungs", "figure.walk", "flame.fill", "bolt.heart.fill", "star"]
    let color = [Color.pink, Color.green, Color.yellow, Color.blue, Color.green, Color.pink]
    var body: some View {
        // MARK: 偵測獎勵等級
        rewardcellView(systemname: systemname[number-1], name: name[number-1], color: color[number-1])
        
    }
}

// MARK: 獎勵的圖案
struct rewardcellView: View {
    var systemname: String
    var name: String
    var color: Color
    var contenttext = "測試文本"
    @State var buttonpressed = false
    var body: some View {
        Button(action: {
            buttonpressed = true
        }, label: {
            Circle()
                .foregroundColor(color)
                .frame(width: 90, height: 90)
                .overlay() {
                    Image(systemName: systemname)
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.black)
                        .padding()
                }
        })
        
        // MARK: Action after tapped
        .popover(isPresented: $buttonpressed) {
            VStack {
                Circle()
                    .foregroundColor(color)
                    .frame(width: 120, height: 120)
                    .overlay() {
                        Image(systemName: systemname)
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.black)
                            .padding()
                    }
                Text("\(NSLocalizedString("\(name)", comment: "\(name)"))")
                    .font(.title)
                
                Text(contenttext)
                    .font(.title2)
            }
            .padding()
            .onAppear() {
                lognow(message: "buttonpressed")
            }
        }
        
        
    }
    func lognow(message: String){
        let today = Date()
        let hours   = (Calendar.current.component(.hour, from: today))
        let minutes = (Calendar.current.component(.minute, from: today))
        let seconds = (Calendar.current.component(.second, from: today))
        let formatter1 = DateFormatter()
        formatter1.dateFormat = "dd/MM/yyyy"
        let datedatanow = "\(formatter1.string(from: today))"
        NSLog("rewardView: \(datedatanow) \(hours):\(minutes):\(seconds) - \(message)")
        
    }
}



struct rewardView_Previews: PreviewProvider {
    static var previews: some View {
        rewardView(number: 1)
    }
}
