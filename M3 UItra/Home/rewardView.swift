//
//  rewardView.swift
//  M3 UItra
//
//  Created by HingTatTsang on 17/8/2022.
//

import SwiftUI

struct rewardView: View {
    var number = 1
    var body: some View {
        // MARK: 偵測獎勵等級
        switch number {
        case 1:
            rewardcellView(systemname: "heart", name: "生命於心跳", color: .pink)
        case 2:
            rewardcellView(systemname: "lungs", name: "鐵肺", color: .green)
        case 3:
            rewardcellView(systemname: "figure.walk", name: "步行者", color: .yellow)
        case 4:
            rewardcellView(systemname: "flame.fill", name: "烈火戰士", color: .blue)
        case 5:
            rewardcellView(systemname: "bolt.heart.fill", name: "瘋狂心臟", color: .green)
        case 6:
            rewardcellView(systemname: "star", name: "摘星者",color: .pink)
        default:
            errorView(errorcode: "No reward no data.")
                .frame(width: 120, height: 120)
        }
    }
}

// MARK: 獎勵的圖案
struct rewardcellView: View {
    var systemname: String
    var name: String
    var color: Color
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
                Text(name)
                    .font(.title)
            }
            .padding()
        }
        
        
    }
}

struct rewardView_Previews: PreviewProvider {
    static var previews: some View {
        rewardView(number: 1)
    }
}
