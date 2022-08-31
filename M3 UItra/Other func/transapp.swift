//
//  transapp.swift
//  AI教你做運動
//
//  Created by HingTatTsang on 30/8/2022.
//

import SwiftUI
import NearbyInteraction
import MultipeerConnectivity


struct transapp: View {
    let defaults = UserDefaults.standard
    @State var alldatakey = ["ismoved"]
    @State var alldatastring = ["ismoved"]
    
    var body: some View {
        ScrollView {
            let all = ["\(alldatakey.joined(separator: "-key-"))", "\(alldatastring.joined(separator: "-string-"))"]
            Text("\(all.joined(separator: "-all-"))")
                .onTapGesture {
                    UIPasteboard.general.string = "\(all.joined(separator: "-all-"))"
                }
        }
        .onAppear() {
            savealldata()
        }
    }
    func savealldata() -> Void {
        let alldata = Array(defaults.dictionaryRepresentation().keys)
        for i in alldata {
            let datastr = defaults.string(forKey: "\(i)")
            alldatakey.append(i)
            alldatastring.append(datastr ?? "nil")
        }
        
    }

}

struct transappread: View {
    let defaults = UserDefaults.standard
    @State var alldatakey = ["ismoved"]
    @State var alldatastring = ["ismoved"]
    
    @State var text = ""
    
    var body: some View {
        VStack {
            TextEditor(text: $text)
            Button("ok") {
//                loadalldata(str: text)
//                exit(0)
            }
        }
    }
    func loadalldata(str: String) -> Void {
        let array = str.components(separatedBy: "-all-")
        let key = array[0]
        let arraykey = key.components(separatedBy: "-key-")
        let string = array[1]
        let arraystr = string.components(separatedBy: "-string-")
        for i in 0..<arraykey.count {
            defaults.set("\(arraystr[i])", forKey: "\(arraykey[i])")
        }
    }

}


struct transapp_Previews: PreviewProvider {
    static var previews: some View {
        transapp()
    }
}
