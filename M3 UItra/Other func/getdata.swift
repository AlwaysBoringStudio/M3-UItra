//
//  readdata.swift
//  AI教你做運動
//
//  Created by HingTatTsang on 30/9/2022.
//

import Foundation
import SwiftUI

class getdata {
    func getdefaultsdata(type: String) -> String {
        let defaults = UserDefaults.standard
        let type = defaults.string(forKey: "\(type)")
        return type ?? ""
    }
    func savedefaultsdata(type: String, data: String) -> Void {
        let defaults = UserDefaults.standard
        defaults.set(data, forKey: "\(type)")
    }
    
    func getdefaultsdatabool(type: String) -> Bool {
        let defaults = UserDefaults.standard
        let type = defaults.bool(forKey: "\(type)")
        return type
    }
    func savedefaultsdatabool(type: String, data: Bool) -> Void {
        let defaults = UserDefaults.standard
        defaults.set(data, forKey: "\(type)")
    }
    
    func getdefaultsdataint(type: String) -> Int {
        let defaults = UserDefaults.standard
        let type = defaults.integer(forKey: "\(type)")
        return type
    }
    func savedefaultsdataint(type: String, data: Int) -> Void {
        let defaults = UserDefaults.standard
        defaults.set(data, forKey: "\(type)")
    }
    
    func getdata(date: String, datanum: Int) -> String {
        let defaults = UserDefaults.standard
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: date)
        
        let today = date
        let formatter1 = DateFormatter()
        formatter1.dateFormat = "dd/MM/yyyy"
        let datedatanow = "\(formatter1.string(from: today ?? Date()))"
        let dataitem1 = defaults.string(forKey: "\(datedatanow)dataitem1")
        let dataitem2 = defaults.string(forKey: "\(datedatanow)dataitem2")
        let dataitem3 = defaults.string(forKey: "\(datedatanow)dataitem3")
        let dataitem4 = defaults.string(forKey: "\(datedatanow)dataitem4")
        //let dataholiday = defaults.bool(forKey: "\(datedatanow)dataholiday")
        let datacal1 = defaults.string(forKey: "\(datedatanow)datacal1")
        let datacal2 = defaults.string(forKey: "\(datedatanow)datacal2")
        let datacal3 = defaults.string(forKey: "\(datedatanow)datacal3")
        let datacal4 = defaults.string(forKey: "\(datedatanow)datacal4")
        
        //let holiday = dataholiday
        let item1 = dataitem1 ?? "N/A"
        let item2 = dataitem2 ?? "N/A"
        let item3 = dataitem3 ?? "N/A"
        let item4 = dataitem4 ?? "N/A"
        let cal1 = datacal1 ?? "N/A"
        let cal2 = datacal2 ?? "N/A"
        let cal3 = datacal3 ?? "N/A"
        let cal4 = datacal4 ?? "N/A"
        let alldata = ["(nil : N/A)", item1, item2, item3, item4, cal1, cal2, cal3, cal4]
        
        return alldata[datanum]
    }
    func savedata(date: String, datanum: Int, text: String) -> Void {
        let defaults = UserDefaults.standard
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: date)
        
        let today = date
        let formatter1 = DateFormatter()
        formatter1.dateFormat = "dd/MM/yyyy"
        let datedatanow = "\(formatter1.string(from: today!))"
        
        if datanum == 0 {
            defaults.set(text, forKey: "\(datedatanow)dataitem1")
        }
        if datanum == 1 {
            defaults.set(text, forKey: "\(datedatanow)dataitem2")
        }
        if datanum == 2 {
            defaults.set(text, forKey: "\(datedatanow)dataitem3")
        }
        if datanum == 3 {
            defaults.set(text, forKey: "\(datedatanow)dataitem4")
        }
        if datanum == 4 {
            defaults.set(text, forKey: "\(datedatanow)datacal1")
        }
        if datanum == 5 {
            defaults.set(text, forKey: "\(datedatanow)datacal2")
        }
        if datanum == 6 {
            defaults.set(text, forKey: "\(datedatanow)datacal3")
        }
        if datanum == 7 {
            defaults.set(text, forKey: "\(datedatanow)datacal4")
        }
    }
    func clear() -> Void {
        let defaults = UserDefaults.standard
        let dictionary = defaults.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            defaults.removeObject(forKey: key)
        }
    }
}

