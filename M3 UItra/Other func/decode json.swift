//
//  decode json.swift
//  M3 UItra
//
//  Created by HingTatTsang on 18/8/2022.
//

import Foundation
import SwiftUI

struct Caldata: Codable, Identifiable {
    enum Caldatainfo: CodingKey {
        case name
        case cal
    }
    
    var id = UUID()
    var name: String
    var cal: Int
}

class ReadData: ObservableObject  {
    @Published var caldatas = [Caldata]()
    
    init(){
        loadData()
    }
    
    func loadData()  {
        guard let url = Bundle.main.url(forResource: "Data", withExtension: "json")
            else {
                print("Json file not found")
                return
            }
        
        let data = try? Data(contentsOf: url)
        let caldatas = try? JSONDecoder().decode([Caldata].self, from: data!)
        self.caldatas = caldatas!
        
    }
     
}

