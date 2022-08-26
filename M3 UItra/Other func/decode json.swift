//
//  decode json.swift
//  M3 UItra
//
//  Created by HingTatTsang on 18/8/2022.
//

import Foundation
import SwiftUI

public class UserFetcher: ObservableObject {

    @Published var users = [User]()
    
    init(){
        load()
    }
    
    func load() {
        let url = URL(string: "https://alwaysboringstudio.site/M3-UItra/M3%20UItra/Data.json")!

    
        URLSession.shared.dataTask(with: url) {(data,response,error) in
            do {
                if let d = data {
                    let decodedLists = try JSONDecoder().decode([User].self, from: d)
                    DispatchQueue.main.async {
                        self.users = decodedLists
                    }
                }else {
                    //no data
                }
            } catch {
                //error
            }
            
        }.resume()
       
    }
}

struct jsondatatest: View {
    @ObservedObject var fetcher = UserFetcher()
    var body: some View {
        List {
            Section(header: Text("以下是運動1小時的卡路里消耗量")) {
                ForEach(fetcher.users) { user in
                    HStack {
                        Text(user.name)
                        Spacer()
                        Text("\(user.cal) cal")
                    }
                }
            }
        }
    }
}


struct User: Codable, Identifiable {
    public var id: Int
    public var name: String
    public var cal: String
    
    enum CodingKeys: String, CodingKey {
           case id = "id"
           case name = "name"
           case cal = "cal"
        }
}

