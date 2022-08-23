//
//  dateView.swift
//  M3 UItra
//
//  Created by HingTatTsang on 15/8/2022.
//

import SwiftUI


struct dateView: View {
    let defaults = UserDefaults.standard
    @State var date: String
    @State var item1 = ""
    @State var item2 = ""
    @State var item3 = ""
    @State var item4 = ""
    @State var cal = ""
    @State var starttime = ""
    @State var endtime = ""
    @State var holiday = false
    @State var month: String
    @State var fullyear: String
    
    @State var popover = false
    
    @State var weekday = ""
    
    @State var add = false
    @State var adderror = false
    
    @State var alertdata = 0
    
    @State var itemeditdata = ""
    
    @State var itemeditdata1 = false
    @State var itemeditdata2 = false
    @State var itemeditdata3 = false
    @State var itemeditdata4 = false
    
    @State var today = false
    
    var body: some View {
        VStack {
            if today == true {
                HStack {
                    VStack {
                        Spacer()
                            .frame(height: 10)
                        Button(action: {
                            popover = true
                        }, label: {
                            Rectangle()
                                .foregroundColor(.yellow)
                                .opacity(0.7)
                                .frame(width: 347, height: 140)
                                .overlay() {
                                    HStack {
                                        ZStack {
                                            VStack {
                                                Spacer()
                                                HStack {
                                                    Text("\(fullyear)年 \(getdayofweeknow())")
                                                        .foregroundColor(.black)
                                                        .padding(.horizontal)
                                                }
                                                Text("\(month)月\(date)日 ")
                                                    .font(.title)
                                                    .bold()
                                                    .foregroundColor(.black)
                                                Spacer()


                                            }
                                            .frame(width: 173.5)
                                        }
                                        VStack {
                                            if isnil() == true {
                                                HStack {
                                                    Text("未編排任何活動")
                                                        .bold()
                                                        .foregroundColor(.black)
                                                    
                                                }
                                            }
                                            if item1 != "" {
                                                HStack {
                                                    Text(" · \(item1)")
                                                        .bold()
                                                        .foregroundColor(.black)
                                                    Spacer()
                                                    
                                                }
                                            }
                                            if item2 != "" {
                                                HStack {
                                                    Text(" · \(item2)")
                                                        .bold()
                                                        .foregroundColor(.black)
                                                    Spacer()
                                                    
                                                }
                                            }
                                            if item3 != "" {
                                                HStack {
                                                    Text(" · \(item3)")
                                                        .bold()
                                                        .foregroundColor(.black)
                                                    Spacer()
                                                    
                                                }
                                            }
                                            if item4 != "" {
                                                HStack {
                                                    Text(" · \(item4)")
                                                        .bold()
                                                        .foregroundColor(.black)
                                                    Spacer()
                                                    
                                                }
                                            }
                                            
                                        }.frame(width: 173.5)
                                    }

                                }
                        })
                    }
                
                }
                
            } else {
                if holiday == true {
                    Rectangle()
                        .foregroundColor(.red)
                        .opacity(0.8)
                        .frame(width: 347, height: 100)
                        .overlay() {
                            VStack {
                                HStack {
                                    Text("\(correctdate(num: date))日  Holiday")
                                        .bold()
                                        .font(.largeTitle)
                                        .foregroundColor(.black)
                                }
                                
                            }
                        }
                } else {
                    Button(action: {
                        if getrightdate() != getdatecom() {
                            popover = true
                        }
                        
                        
                    }) {
                        HStack {
                            if getrightdate() == getdatecom() {
                                
                                Rectangle()
                                    .foregroundColor(.yellow)
                                    .opacity(0.7)
                                    .frame(width: 347, height: 100)
                                    .overlay() {
                                        HStack {
                                            VStack {
                                                Spacer()
                                                HStack {
                                                    Text("\(fullyear)年 \(getdayofweeknow())")
                                                        .foregroundColor(.black)
                                                        .padding(.horizontal)
                                                }
                                                Text("\(month)月\(date)日 ")
                                                    .font(.title)
                                                    .bold()
                                                    .foregroundColor(.black)
                                                Spacer()


                                            }
                                            VStack {
                                                Text("今天")
                                                    .bold()
                                                    .font(.largeTitle)
                                                    .foregroundColor(.black)
                                                
                                                
                                            }
                                        }
                                    }
                                    
                            } else {
                                HStack {
                                    Rectangle()
                                        .foregroundColor(.black)
                                        .opacity(0.5)
                                        .frame(width: 70, height: 100)
                                        .overlay() {
                                            VStack {
                                                Text("\(correctdate(num: date))日")
                                                    .bold()
                                                    .font(.title3)
                                                    .foregroundColor(.black)
                                                Text(getdayofweeknow())
                                                    .bold()
                                                    .foregroundColor(.black)
                                                
                                            }
                                        }
                                    Rectangle()
                                        .foregroundColor(.red)
                                        .opacity(0.6)
                                        .frame(width: 170, height: 100)
                                        .overlay() {
                                            VStack {
                                                if isnil() == true {
                                                    HStack {
                                                        Text("未編排任何活動")
                                                            .bold()
                                                            .foregroundColor(.black)
                                                        
                                                    }
                                                }
                                                if item1 != "" {
                                                    HStack {
                                                        Text(" · \(item1)")
                                                            .bold()
                                                            .foregroundColor(.black)
                                                        Spacer()
                                                    }
                                                }
                                                if item2 != "" {
                                                    HStack {
                                                        Text(" · \(item2)")
                                                            .bold()
                                                            .foregroundColor(.black)
                                                        Spacer()
                                                    }
                                                }
                                                if item3 != "" {
                                                    HStack {
                                                        Text(" · \(item3)")
                                                            .bold()
                                                            .foregroundColor(.black)
                                                        Spacer()
                                                    }
                                                }
                                                if item4 != "" {
                                                    HStack {
                                                        Text(" · \(item4)")
                                                            .bold()
                                                            .foregroundColor(.black)
                                                        Spacer()
                                                    }
                                                }
                                                
                                            }
                                        }
                                    
                                    Rectangle()
                                        .foregroundColor(.green)
                                        .opacity(0.5)
                                        .frame(width: 90, height: 100)
                                        .overlay() {
                                            ZStack {
                                                VStack {
                                                    HStack {
                                                        Spacer()
                                                        VStack {
                                                            if cal == "" {
                                                                Text("0")
                                                                    .bold()
                                                                    .foregroundColor(.black)
                                                            } else {
                                                                Text(cal)
                                                                    .bold()
                                                                    .foregroundColor(.black)
                                                                
                                                            }
                                                            Text("卡路里")
                                                                .bold()
                                                                .foregroundColor(.black)
                                                        }
                                                        Spacer()
                                                    }
                                                    
                                                }
                                                
                                                
                                                
                                            }
                                        }
                                }
                            }
                            
                            
                        }
                    }
                    
                }
            }
                
        }
//        (isPresented: $popover,attachmentAnchor: .point(.center), arrowEdge: .trailing) {
        .sheet(isPresented: $popover) {
            NavigationView {
                ZStack {
                    VStack {
                        Spacer()
                            .frame(height: 5)
                        Color.white
                            .edgesIgnoringSafeArea(.all)
                    }
                    VStack {
                        VStack {
                            Rectangle()
                                .foregroundColor(.yellow)
                                .opacity(0.7)
                                .frame(width: 347, height: 100)
                                .overlay() {
                                    if today == true {
                                        VStack {
                                            Spacer()
                                            Text("今天 (\(getdayofweeknow()))")
                                                .foregroundColor(.black)
                                                .font(.largeTitle)
                                                .bold()
                                            
                                            Spacer()
                                        }
                                    } else if getrightdate() == getdatecom() {
                                        VStack {
                                            Spacer()
                                            Text("今天 (\(getdayofweeknow()))")
                                                .foregroundColor(.black)
                                                .font(.largeTitle)
                                                .bold()
                                            
                                            Spacer()
                                        }
                                    } else {
                                        VStack {
                                            Spacer()
                                            HStack {
                                                Text("\(fullyear)年")
                                                    .foregroundColor(.black)
                                                    .padding(.horizontal)
                                                Spacer()
                                            }
                                            Text("\(correctdate(num: month))月\(correctdate(num: date))日 (\(getdayofweeknow()))")
                                                .foregroundColor(.black)
                                                .font(.largeTitle)
                                                .bold()
                                            
                                            Spacer()
                                        }
                                    }
                                    
                                }
                            Rectangle()
                                .foregroundColor(.blue)
                                .opacity(0.5)
                                .frame(width:347, height: 450)
                                .overlay() {
                                    ZStack {
                                        VStack {
                                            Text("已編排:")
                                                .font(.largeTitle)
                                                .foregroundColor(.black)
                                                .padding()
                                            Spacer()
                                        }
                                        VStack {
                                            if isnil() == true {
                                                HStack {
                                                    Text("未編排任何活動")
                                                        .font(.largeTitle)
                                                        .foregroundColor(.black)
                                                    
                                                }
                                            }
                                            if item1 != "" {
                                                HStack {
                                                    Text(" · \(item1)")
                                                        .font(.largeTitle)
                                                        .foregroundColor(.black)
                                                        .onTapGesture(perform: {
                                                            popover = false
                                                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                                                                itemeditdata1 = true
                                                            }
                                                        })
                                                }
                                                
                                            }
                                            if item2 != "" {
                                                HStack {
                                                    Text(" · \(item2)")
                                                        .font(.largeTitle)
                                                        .foregroundColor(.black)
                                                        .onTapGesture(perform: {
                                                            popover = false
                                                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                                                                itemeditdata2 = true
                                                            }
                                                        })
                                                }
                                            }
                                            if item3 != "" {
                                                HStack {
                                                    Text(" · \(item3)")
                                                        .font(.largeTitle)
                                                        .foregroundColor(.black)
                                                        .onTapGesture(perform: {
                                                            popover = false
                                                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                                                                itemeditdata3 = true
                                                            }
                                                        })
                                                }
                                            }
                                            if item4 != "" {
                                                HStack {
                                                    Text(" · \(item4)")
                                                        .font(.largeTitle)
                                                        .foregroundColor(.black)
                                                        .onTapGesture(perform: {
                                                            popover = false
                                                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                                                                itemeditdata4 = true
                                                            }
                                                        })
                                                }
                                            }
                                        }
                                    }
                                }
                        }
                    }
                }
                .navigationTitle("已編排")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(leading:
                                        Button("完成") {
                    loadalldata()
                    popover = false
                },
                                    trailing: Button(action: {
                                        popover = false
                                        itemeditdata = ""
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                                            add = true
                                        }
                                    }, label: {
                                        Image(systemName: "plus")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                            .padding()
                                    }))
            }
        }
        .onDisappear() {
            savealldata()
        }
        .onAppear() {
            loadalldata()
            
        }
        .sheet(isPresented: $add) {
            NavigationView {
                List {
                    Section {
                        TextField("請輸入要新增的活動", text: $itemeditdata)
                    }
                    Section {
                        HStack {
                            Spacer()
                            Button("新增", action: {
                                if item1 == "" {
                                    item1 = itemeditdata
                                    alertdata = 1
                                    add = false
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                                        popover = true
                                    }
                                } else if item2 == "" {
                                    item2 = itemeditdata
                                    alertdata = 2
                                    add = false
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                                        popover = true
                                    }
                                } else if item3 == "" {
                                    item3 = itemeditdata
                                    alertdata = 3
                                    add = false
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                                        popover = true
                                    }
                                } else if item4 == "" {
                                    item4 = itemeditdata
                                    alertdata = 4
                                    add = false
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                                        popover = true
                                    }
                                } else if item4 != ""{
                                    add = false
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                                        adderror = true
                                    }
                                }
                                savealldata()
                            })
                            Spacer()
                        }
                        HStack {
                            Spacer()
                            Button("取消", action: {
                                add = false
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                                    popover = true
                                }
                            }).foregroundColor(.red)
                            Spacer()
                        }
                    }
                    
                
                    
                }
                .navigationTitle("請輸入要新增的活動:")
//                .interactiveDismissDisabled()
                
            }
            
        }
        
        .sheet(isPresented: $adderror) {
            NavigationView {
                List {
                    Section {
                        HStack {
                            Spacer()
                            Button("取消") {
                                adderror = false
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                                    popover = true
                                }
                                
                            }
                            Spacer()
                        }
                    }
                }
                .navigationTitle("每天只能計劃四個活動")
                .interactiveDismissDisabled()
            }
        }
        .sheet(isPresented: $itemeditdata1) {
            NavigationView {
                List {
                    Section {
                        TextField("請輸入要新增的活動", text: $item1)
                    }
                    Section {
                        HStack {
                            Spacer()
                            Button("完成") {
                                itemeditdata1 = false
                                savealldata()
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                                    popover = true
                                }
                            }
                            Spacer()
                        }
                        HStack {
                            Spacer()
                            Button("刪除") {
                                item1 = ""
                                item1 = item2
                                item2 = item3
                                item3 = item4
                                item4 = ""
                                itemeditdata1 = false
                                savealldata()
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                                    popover = true
                                }
                            }.foregroundColor(.red)
                            Spacer()
                        }
                    }
                }
                
                .navigationTitle("更改已編排的活動")
                .interactiveDismissDisabled()
            }
        }
        .sheet(isPresented: $itemeditdata2) {
            NavigationView {
                List {
                    Section {
                        TextField("請輸入要新增的活動", text: $item2)
                    }
                    Section {
                        HStack {
                            Spacer()
                            Button("完成") {
                                itemeditdata2 = false
                                savealldata()
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                                    popover = true
                                }
                            }
                            Spacer()
                        }
                        HStack {
                            Spacer()
                            Button("刪除") {
                                item2 = ""
                                item2 = item3
                                item3 = item4
                                item4 = ""
                                itemeditdata2 = false
                                savealldata()
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                                    popover = true
                                }
                            }.foregroundColor(.red)
                            Spacer()
                        }
                    }
                    
                }
                
                .navigationTitle("更改已編排的活動")
                .interactiveDismissDisabled()
            }
        }
        .sheet(isPresented: $itemeditdata3) {
            NavigationView {
                List {
                    Section {
                        TextField("請輸入要新增的活動", text: $item3)
                    }
                    Section {
                        HStack {
                            Spacer()
                            Button("完成") {
                                itemeditdata3 = false
                                savealldata()
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                                    popover = true
                                }
                            }
                            Spacer()
                        }
                        HStack {
                            Spacer()
                            Button("刪除") {
                                item3 = ""
                                item3 = item4
                                item4 = ""
                                itemeditdata3 = false
                                savealldata()
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                                    popover = true
                                }
                            }.foregroundColor(.red)
                            Spacer()
                        }
                    }
                }
                
                .navigationTitle("更改已編排的活動")
                .interactiveDismissDisabled()
            }
        }
        .sheet(isPresented: $itemeditdata4) {
            NavigationView {
                List {
                    Section {
                        Text("更改已編排的活動")
                    }
                    Section {
                        TextField("請輸入要新增的活動", text: $item4)
                    }
                    Section {
                        HStack {
                            Spacer()
                            Button("完成") {
                                itemeditdata4 = false
                                savealldata()
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                                    popover = true
                                }
                            }
                            Spacer()
                        }
                        HStack {
                            Spacer()
                            Button("刪除") {
                                item4 = ""
                                itemeditdata4 = false
                                savealldata()
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                                    popover = true
                                }
                            }.foregroundColor(.red)
                            Spacer()
                        }
                    }
                    
                }
                
                .navigationTitle("更改已編排的活動")
                .interactiveDismissDisabled()
            }
        }
    }
    func loadalldata() -> Void {
        let today = getrightdate()
        let formatter1 = DateFormatter()
        formatter1.dateFormat = "dd/MM/yyyy"
        let datedatanow = "\(formatter1.string(from: today))"
        let dataitem1 = defaults.string(forKey: "\(datedatanow)dataitem1")
        let dataitem2 = defaults.string(forKey: "\(datedatanow)dataitem2")
        let dataitem3 = defaults.string(forKey: "\(datedatanow)dataitem3")
        let dataitem4 = defaults.string(forKey: "\(datedatanow)dataitem4")
        let dataholiday = defaults.bool(forKey: "\(datedatanow)dataholiday")
        let datacal = defaults.string(forKey: "\(datedatanow)datacal")
        item1 = dataitem1 ?? ""
        item2 = dataitem2 ?? ""
        item3 = dataitem3 ?? ""
        item4 = dataitem4 ?? ""
        holiday = dataholiday
        cal = datacal ?? ""
    }
    func savealldata() -> Void {
        let today = getrightdate()
        let formatter1 = DateFormatter()
        formatter1.dateFormat = "dd/MM/yyyy"
        let datedatanow = "\(formatter1.string(from: today))"
        if item1 != "" {
            defaults.set(item1, forKey: "\(datedatanow)dataitem1")
        } else {
            defaults.removeObject(forKey: "\(datedatanow)dataitem1")
        }
        if item2 != "" {
            defaults.set(item2, forKey: "\(datedatanow)dataitem2")
        } else {
            defaults.removeObject(forKey: "\(datedatanow)dataitem2")
        }
        if item3 != "" {
            defaults.set(item3, forKey: "\(datedatanow)dataitem3")
        } else {
            defaults.removeObject(forKey: "\(datedatanow)dataitem3")
        }
        if item4 != "" {
            defaults.set(item4, forKey: "\(datedatanow)dataitem4")
        } else {
            defaults.removeObject(forKey: "\(datedatanow)dataitem4")
        }
        if holiday != false {
            defaults.set(holiday, forKey: "\(datedatanow)dataholiday")
        } else {
            defaults.removeObject(forKey: "\(datedatanow)dataholiday")
        }
        if cal != "" {
            defaults.set(cal, forKey: "\(datedatanow)datacal")
        } else {
            defaults.removeObject(forKey: "\(datedatanow)datacal")
        }
        print("data saved")
    }
    
    func stringtofloat(string: String) -> Float {
        let numberFormatter = NumberFormatter()
        let number = numberFormatter.number(from: string)
        let numberFloatValue = number?.floatValue ?? 0
        return numberFloatValue
    }
    
    func getdayofweeknow() -> String {
        let datecorrect = correctdate(num: month)
        let datecorrectday = correctdate(num: date)
        let mem = getDayOfWeek("\(datecorrectday)/\(datecorrect)/\(fullyear)", format:"dd/MM/yyyy") ?? ""
        return mem
    }
    
    func getDayOfWeek(_ date:String, format: String) -> String? {
        
        let weekDays = [
            "星期日",
            "星期一",
            "星期二",
            "星期三",
            "星期四",
            "星期五",
            "星期六"
        ]

        let formatter  = DateFormatter()
        formatter.dateFormat = format
        guard let myDate = formatter.date(from: date) else { return nil }
        
        let myCalendar = Calendar(identifier: .gregorian)
        let weekDay = myCalendar.component(.weekday, from: myDate)
        
        
        return weekDays[weekDay-1]
    }
    
    func correctdate(num: String) -> String {
        let add0 = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
        var new = ""
        if add0.contains(num) {
            new = ("0\(num)")
        } else {
            new = ("\(num)")
        }
        return new
    }
    
    func getdatecom() -> Date {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let string = "\(dateFormatter.string(from: date))"
        dateFormatter.dateFormat = "dd/MM/yyyy"
        dateFormatter.date(from: string)
        return dateFormatter.date(from: string) ?? Date()
    }
    
    func getrightdate() -> Date {
        let datecorrect = correctdate(num: month)
        let datecorrectday = correctdate(num: date)
        print("\(fullyear)年\(datecorrect)月\(datecorrectday)日")
        
        let string = "\(datecorrectday)/\(datecorrect)/\(fullyear)"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        dateFormatter.date(from: string)
        return dateFormatter.date(from: string) ?? Date()
    }
    
    func isnil() -> Bool {
        var boool = false
        if item1 == "" {
            if item2 == "" {
                if item3 == "" {
                    if item4 == "" {
                        boool = true
                    }
                }
            }
        }
        return boool
        
    }
    func counrnum() -> Int {
        var num = 0
        if item1 != "" {
            num = 1
        }
        if item2 != "" {
            num = 2
        }
        if item3 != "" {
            num = 4
        }
        if item4 != "" {
            num = 5
        }
        return num
    }
    
}

struct dateView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            dateView(date: "2", month: "8", fullyear: "2022", today: true)
            dateView(date: "3", month: "8", fullyear: "2022")
            dateView(date: "10", month: "8", fullyear: "2022")
            dateView(date: "12", month: "8", fullyear: "2022")
            dateView(date: "20", month: "8", fullyear: "2022")
        }
    }
}
