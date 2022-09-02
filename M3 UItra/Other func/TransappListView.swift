//
//  TransappListView.swift
//  AI教你做運動
//
//  Created by HingTatTsang on 30/8/2022.
//

import SwiftUI

struct RemoteListView: View {
  @EnvironmentObject var remoteConnectionManager: RemoteConnectionManager

  var body: some View {
    ZStack {
        VStack {
            Text("正在等待連線")
                .font(.largeTitle)
            Button("返回") {
                remoteConnectionManager.leaveRemote()
            }
            .padding()
            ProgressView()
        }
        ZStack {
            Group {
                ScrollViewReader { reader in
                  VStack(alignment: .leading, spacing: 20) {
                    ForEach(remoteConnectionManager.messages) { message in
                        if remoteConnectionManager.isHosting == false {
                            MessageBodyView(message: message)
                              .onAppear {
                                if message == remoteConnectionManager.messages.last {
                                  reader.scrollTo(message.id)
                                }
                                  remoteConnectionManager.leaveRemote()
                              }
                        } else {
                            MessageBodyView2(message: message)
                              .onAppear {
                                if message == remoteConnectionManager.messages.last {
                                  reader.scrollTo(message.id)
                                }
                                  
                              }
                        }
                    }
                  }
                  .padding(16)
                }
            }
            .opacity(0)
            
        }
    }
  }
    
}

class getLocalNetworkAccessState : NSObject {
    var service: NetService
    var denied: DispatchWorkItem?
    var completion: ((Bool) -> Void)
    
    @discardableResult
    init(completion: @escaping (Bool) -> Void) {
        self.completion = completion
        
        service = NetService(domain: "local.", type:"_lnp._tcp.", name: "LocalNetworkPrivacy", port: 1100)
        
        super.init()
        
        denied = DispatchWorkItem {
            self.completion(false)
            self.service.stop()
            self.denied = nil
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: denied!)
        
        service.delegate = self
        self.service.publish()
    }
}

extension getLocalNetworkAccessState : NetServiceDelegate {
    
    func netServiceDidPublish(_ sender: NetService) {
        denied?.cancel()
        denied = nil

        completion(true)
    }
    
    func netService(_ sender: NetService, didNotPublish errorDict: [String : NSNumber]) {
        NSLog("Error: \(errorDict)")
    }
}


struct MessageBodyView: View {
    let message: RemoteMessage
    let defaults = UserDefaults.standard

      var body: some View {
        HStack {
          VStack {
            Text(message.body)
          }
        }
    }
}

struct MessageBodyView2: View {
    let message: RemoteMessage
    let defaults = UserDefaults.standard
    @State var quit = false
      var body: some View {
        HStack {
          VStack {
            Text(message.body)
          }.onAppear() {
              quit = true
              
          }
        }
        .alert("退出此App以保存更改", isPresented: $quit, actions: {
            Button("退出") {
                let dictionary = defaults.dictionaryRepresentation()
                dictionary.keys.forEach { key in
                    defaults.removeObject(forKey: key)
                }
                loadalldata(str: message.body)
                exit(0)
            }
        })
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
        defaults.set(true, forKey: "transapp")
    }
}
struct RemoteView: View {
    @EnvironmentObject var remoteConnectionManager: RemoteConnectionManager
    
    let defaults = UserDefaults.standard
    @State var alldatakey = ["ismoved"]
    @State var alldatastring = ["ismoved"]

  var body: some View {
    VStack {
      RemoteListView()
        .environmentObject(remoteConnectionManager)
      messageField
            .opacity(0)
    }
    .navigationBarBackButtonHidden(true)
  }

  private var messageField: some View {
    VStack(spacing: 0) {
        Text("loading")
      .onAppear() {
          if remoteConnectionManager.isHosting == true {
              
          } else {
              savealldata()
              let all = ["\(alldatakey.joined(separator: "-key-"))", "\(alldatastring.joined(separator: "-string-"))"]
              remoteConnectionManager.send("\(all.joined(separator: "-all-"))")
              NSLog("\(all.joined(separator: "-all-"))")
          }
          
      }
      .padding()
    }
  }
    func savealldata() -> Void {
        let alldata = Array(defaults.dictionaryRepresentation().keys)
        for i in alldata {
            let datastr = defaults.string(forKey: "\(i)")
            if i.contains("data") == true {
                alldatakey.append(i)
                alldatastring.append(datastr ?? "nil")
            } else if i.contains("reward") == true {
                alldatakey.append(i)
                alldatastring.append(datastr ?? "nil")
            } else if i.contains("showwelcome") == true {
                alldatakey.append(i)
                alldatastring.append(datastr ?? "nil")
            } else if i.contains("username") == true {
                alldatakey.append(i)
                alldatastring.append(datastr ?? "nil")
            } else if i.contains("notifyon") == true {
                alldatakey.append(i)
                alldatastring.append(datastr ?? "nil")
            } else if i.contains("firstopen") == true {
                alldatakey.append(i)
                alldatastring.append(datastr ?? "nil")
            }
            
        }
        
    }



}


struct JoinSessionView: View {
  @ObservedObject private var remoteConnectionManager = RemoteConnectionManager()

  var body: some View {
    VStack(spacing: 24) {
      Button(
        action: {
          remoteConnectionManager.join()
        }, label: {
          Rectangle()
            .frame(width: 350, height: 50)
            .foregroundColor(.blue)
            .cornerRadius(25)
            .overlay() {
              Label("轉移數據到另一部裝置", systemImage: "square.and.arrow.up.fill")
                    .foregroundColor(.black)
            }
        })
      
      Button(
        action: {
          remoteConnectionManager.host()
        }, label: {
          Rectangle()
            .frame(width: 350, height: 50)
            .foregroundColor(.blue)
            .cornerRadius(25)
            .overlay() {
              Label("轉移數據到此裝置", systemImage: "square.and.arrow.down.fill")
                    .foregroundColor(.black)
            }
        })
      NavigationLink(
        destination: RemoteView()
          .environmentObject(remoteConnectionManager),
        isActive: $remoteConnectionManager.connectedToRemote) {
          EmptyView()
      }
    }
  }
}

struct RemoteMessage: Identifiable, Equatable, Codable {
  var id = UUID()
  let displayName: String
  let body: String
  var time = Date()

  var isUser: Bool {
    return displayName == UIDevice.current.name
  }
}
