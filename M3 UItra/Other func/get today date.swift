//
//  get today date.swift
//  M3 UItra
//
//  Created by HingTatTsang on 18/8/2022.
//

import SwiftUI
import Foundation

struct todaydate: View {
    var body: some View {
        VStack {
            Text("dd.MM.yyyy: \(nowdate(format: "dd.MM.yyyy"))")
                .font(.title)
                .padding()
            Text("dd: \(nowdate(format: "dd"))")
                .font(.title)
                .padding()
            Text("MM: \(nowdate(format: "MM"))")
                .font(.title)
                .padding()
            Text("yyyy: \(nowdate(format: "yyyy"))")
                .font(.title)
                .padding()
        }
    }
}



/// Nowdate
///
/// Get the date today.
///
/// - Parameter Call nowdate(format: "dd.MM.yyyy") 即可獲取今天日期
/// - Parameter 作者: TsangHingTat
///
func nowdate(format: String) -> String {
    let date = Date()
    let dateFormatter = DateFormatter()
     
    dateFormatter.dateFormat = format
     
    let result = dateFormatter.string(from: date)
    
    return result
            
}



struct Previews_get_today_date_Previews: PreviewProvider {
    static var previews: some View {
        todaydate()
    }
}
