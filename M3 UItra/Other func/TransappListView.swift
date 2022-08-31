
import SwiftUI

struct ChatListView: View {
  @EnvironmentObject var chatConnectionManager: ChatConnectionManager

  var body: some View {
    ZStack {
        VStack {
            Text("正在等待連線")
                .font(.largeTitle)
            Button("返回") {
                chatConnectionManager.leaveChat()
            }
            .padding()
            ProgressView()
        }
        ZStack {
            Group {
                ScrollViewReader { reader in
                  VStack(alignment: .leading, spacing: 20) {
                    ForEach(chatConnectionManager.messages) { message in
                        if chatConnectionManager.isHosting == false {
                            MessageBodyView(message: message)
                              .onAppear {
                                if message == chatConnectionManager.messages.last {
                                  reader.scrollTo(message.id)
                                }
                                  chatConnectionManager.leaveChat()
                              }
                        } else {
                            MessageBodyView2(message: message)
                              .onAppear {
                                if message == chatConnectionManager.messages.last {
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
        print("Error: \(errorDict)")
    }
}


struct MessageBodyView: View {
    let message: ChatMessage
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
    let message: ChatMessage
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
struct ChatView: View {
    @EnvironmentObject var chatConnectionManager: ChatConnectionManager
    
    let defaults = UserDefaults.standard
    @State var alldatakey = ["ismoved"]
    @State var alldatastring = ["ismoved"]

  var body: some View {
    VStack {
      ChatListView()
        .environmentObject(chatConnectionManager)
      messageField
            .opacity(0)
    }
    .navigationBarBackButtonHidden(true)
  }

  private var messageField: some View {
    VStack(spacing: 0) {
        Text("loading")
      .onAppear() {
          if chatConnectionManager.isHosting == true {
              
          } else {
              savealldata()
              let all = ["\(alldatakey.joined(separator: "-key-"))", "\(alldatastring.joined(separator: "-string-"))"]
              chatConnectionManager.send("\(all.joined(separator: "-all-"))")
              print("\(all.joined(separator: "-all-"))")
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
  @ObservedObject private var chatConnectionManager = ChatConnectionManager()

  var body: some View {
    VStack(spacing: 24) {
      Button(
        action: {
          chatConnectionManager.join()
        }, label: {
          Rectangle()
            .frame(width: 350, height: 50)
            .foregroundColor(.green)
            .cornerRadius(25)
            .overlay() {
              Label("轉移數據到另一部裝置", systemImage: "square.and.arrow.up.fill")
            }
        })
      
      Button(
        action: {
          chatConnectionManager.host()
        }, label: {
          Rectangle()
            .frame(width: 350, height: 50)
            .foregroundColor(.green)
            .cornerRadius(25)
            .overlay() {
              Label("轉移數據到此裝置", systemImage: "square.and.arrow.down.fill")
            }
        })
      NavigationLink(
        destination: ChatView()
          .environmentObject(chatConnectionManager),
        isActive: $chatConnectionManager.connectedToChat) {
          EmptyView()
      }
    }
  }
}

struct ChatMessage: Identifiable, Equatable, Codable {
  var id = UUID()
  let displayName: String
  let body: String
  var time = Date()

  var isUser: Bool {
    return displayName == UIDevice.current.name
  }
}
