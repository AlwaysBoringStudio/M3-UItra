//
//  calchartCiew.swift
//  M3 UItra
//
//  Created by HingTatTsang on 22/8/2022.
//

import SwiftUI

struct calchartView: View {
    let defaults = UserDefaults.standard
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("過去七天的卡路里消耗量")
                    .font(.title3)
                Spacer()
            }
            HStack {
                barchartView(data: loaddata(datecal: yesterDay(pre: 6)), per: 2000)
                barchartView(data: loaddata(datecal: yesterDay(pre: 5)), per: 2000)
                barchartView(data: loaddata(datecal: yesterDay(pre: 4)), per: 2000)
                barchartView(data: loaddata(datecal: yesterDay(pre: 3)), per: 2000)
                barchartView(data: loaddata(datecal: yesterDay(pre: 2)), per: 2000)
                barchartView(data: loaddata(datecal: yesterDay(pre: 1)), per: 2000)
                barchartView(data: loaddata(datecal: Date()), per: 2000, text: true)
            }
        }
    }
    
    func loaddata(datecal: Date) -> Float {
        let today = datecal
        let formatter1 = DateFormatter()
        formatter1.dateFormat = "dd/MM/yyyy"
        let datedatanow = "\(formatter1.string(from: today))"
        let sum1 = stringtofloat(string: "\(defaults.string(forKey: "\(datedatanow)datacal1") ?? "")")
        let sum2 = stringtofloat(string: "\(defaults.string(forKey: "\(datedatanow)datacal2") ?? "")")
        let sum3 = stringtofloat(string: "\(defaults.string(forKey: "\(datedatanow)datacal3") ?? "")")
        let sum4 = stringtofloat(string: "\(defaults.string(forKey: "\(datedatanow)datacal4") ?? "")")
        let datacal = String(sum1+sum2+sum3+sum4)
        let loaddata = datacal
        return Float(loaddata) ?? 0
    }
    
    func yesterDay(pre: Int) -> Date {
        var dayComponent = DateComponents()
        dayComponent.day = Int(String("-\(Int(pre))"))
        let calendar = Calendar.current
        let nextDay =  calendar.date(byAdding: dayComponent, to: Date())!
        return nextDay
    }
    func testdata(datatoday: Date, datacal: Int) -> Void {
        let today = datatoday
        let formatter1 = DateFormatter()
        formatter1.dateFormat = "dd/MM/yyyy"
        let datedatanow = "\(formatter1.string(from: today))"
        defaults.set(datacal, forKey: "\(datedatanow)datacal")
    }
    func stringtofloat(string: String) -> Float {
        let numberFormatter = NumberFormatter()
        let number = numberFormatter.number(from: string)
        let numberFloatValue = number?.floatValue ?? 0
        return numberFloatValue
    }
    
}

struct calchartView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Text("過去七天的卡路里消耗量")
                .font(.title)
            HStack {
                barchartView(data: 1920, per: 2000)
                barchartView(data: 1368, per: 2000)
                barchartView(data: 1080, per: 2000)
                barchartView(data: 720, per: 2000)
                barchartView(data: 1280, per: 2000)
                barchartView(data: 1200, per: 2000)
                barchartView(data: 1685, per: 2000)
            }
        }
    }
}
