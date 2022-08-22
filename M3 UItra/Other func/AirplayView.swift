//
//  AirplayView.swift
//  M3 UItra
//
//  Created by HingTatTsang on 19/8/2022.
//

import SwiftUI
import Combine


struct AirplayHow: View {
    
    @State var additionalWindows: [UIWindow] = []
    
    private var screenDidConnectPublisher: AnyPublisher<UIScreen, Never> {
        NotificationCenter.default
            .publisher(for: UIScreen.didConnectNotification)
            .compactMap { $0.object as? UIScreen }
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
    
    var body: some View {
        Text("Airplay View")
        .onReceive(
            screenDidConnectPublisher,
            perform: screenDidConnect
        )
    }
    
    private func screenDidConnect(_ screen: UIScreen) {
        let window = UIWindow(frame: screen.bounds)

        window.windowScene = UIApplication.shared.connectedScenes
            .first { ($0 as? UIWindowScene)?.screen == screen }
            as? UIWindowScene

        let view = AirplayView()
        let controller = UIHostingController(rootView: view)
        window.rootViewController = controller
        window.isHidden = false
        additionalWindows.append(window)
    }
    
}


struct Airplaybackgroundhelper: View {
    @ObservedObject var externalDisplayContent = ExternalDisplayContent()
    @State var additionalWindows: [UIWindow] = []
    
    @State var view: AnyView
    
    private var screenDidConnectPublisher: AnyPublisher<UIScreen, Never> {
        NotificationCenter.default
            .publisher(for: UIScreen.didConnectNotification)
            .compactMap { $0.object as? UIScreen }
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
    
    private var screenDidDisconnectPublisher: AnyPublisher<UIScreen, Never> {
        NotificationCenter.default
            .publisher(for: UIScreen.didDisconnectNotification)
            .compactMap { $0.object as? UIScreen }
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
    
    var body: some View {
        Text("background task")
            .opacity(0)
            .onReceive(
                screenDidConnectPublisher,
                perform: screenDidConnect
            )
            .onReceive(
                screenDidDisconnectPublisher,
                perform: screenDidDisconnect
            )
    }
    
    private func screenDidConnect(_ screen: UIScreen) {
        let window = UIWindow(frame: screen.bounds)

        window.windowScene = UIApplication.shared.connectedScenes
            .first { ($0 as? UIWindowScene)?.screen == screen }
            as? UIWindowScene

        let view = view
        let controller = UIHostingController(rootView: view)
        window.rootViewController = controller
        window.isHidden = false
        additionalWindows.append(window)
    }
    private func screenDidDisconnect(_ screen: UIScreen) {
        additionalWindows.removeAll { $0.screen == screen }
        externalDisplayContent.isShowingOnExternalDisplay = false
    }
}

class ExternalDisplayContent: ObservableObject {

    @Published var string = ""
    @Published var isShowingOnExternalDisplay = false

}


struct AirplayView: View {
    let defaults = UserDefaults.standard
    @State var showwelcome = false
    @State var username = ""
    @State var navtitle = "成就"
    @State var health = Float(0)
    @State var caltoday = Float(0)
    @State var reward = 0
    var body: some View {
        // MARK: 任務 Pie Chart
        VStack {
            VStack {
                Image("cal")
                    .resizable()
                    .scaledToFit()
                    .overlay() {
                        ZStack {
                            RingView(
                                percentage: Double(health),
                                backgroundColor: Color.moveRingBackground,
                                startColor: Color.moveRingStartColor,
                                endColor: Color.moveRingEndColor,
                                thickness: Constants.mainRingThickness
                            )
                            VStack {VStack {
                                Text("今天")
                                    .font(.title3)
                                Text("\(Int(health*100))%")
                                    .font(.title3)
                                Text("任務")
                                    .font(.title3)
                            }
                            }
                        }
                    }
               
            }
            // MARK: 卡路里
            VStack {
                Image("cal")
                    .resizable()
                    .scaledToFit()
                    .overlay() {
                        ZStack {
                            RingView(
                                percentage: Double(caltoday/2000),
                                backgroundColor: Color.exerciseRingBackground,
                                startColor: Color.exerciseRingStartColor,
                                endColor: Color.exerciseRingEndColor,
                                thickness: Constants.mainRingThickness
                            )
                            VStack {
                                Text("今天")
                                    .font(.title3)
                                Text("\(Int(caltoday))/2,000")
                                    .font(.title3)
                                Text("卡路里")
                                    .font(.title3)
                            }
                        }
                    }
            }
        }
        
    }
}

struct AirplayView_Previews: PreviewProvider {
    static var previews: some View {
        AirplayView()
    }
}
