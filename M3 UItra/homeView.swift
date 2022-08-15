//
//  homeView.swift
//  M3 UItra
//
//  Created by HingTatTsang on 15/8/2022.
//

import SwiftUI

struct homeView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                ZStack {
                    VStack {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                circleView(systemname: "heart", name: "heart", color: .pink)
                                circleView(systemname: "lungs", name: "lungs", color: .green)
                                circleView(systemname: "figure.walk", name: "figure.walk", color: .yellow)
                                circleView(systemname: "flame.fill", name: "flame.fill", color: .blue)
                                circleView(systemname: "bolt.heart.fill", name: "bolt.heart.fill", color: .green)
                                circleView(systemname: "star", name: "star",color: .pink)
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                }
                HStack {
                    VStack {
                        Image("pie")
                            .resizable()
                            .scaledToFit()
                        Text("任務")
                            .font(.title)
                    }
                    VStack {
                        Image("cal")
                            .resizable()
                            .scaledToFit()
                            .overlay() {
                                VStack {
                                    Text("今天")
                                        .font(.largeTitle)
                                    Text("570 cal")
                                        .font(.largeTitle)
                                    Text("卡路里")
                                        .font(.largeTitle)
                                }
                            }
                    }
                    
                }
                HStack {
                    VStack {
                        Image("rate")
                            .resizable()
                            .scaledToFit()
                        Text("心跳")
                            .font(.title)
                    }
                    VStack {
                        Image("bar")
                            .resizable()
                            .scaledToFit()
                        Text("卡路里")
                            .font(.title)
                    }
                    
                }
            }
            .navigationTitle("成就")
            .background(NavigationConfigurator { nc in
                            nc.navigationBar.barTintColor = .blue
                            nc.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white]
                        })
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .frame(maxWidth: 800)
        
    }
}

struct NavigationConfigurator: UIViewControllerRepresentable {
    var configure: (UINavigationController) -> Void = { _ in }

    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController {
        UIViewController()
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NavigationConfigurator>) {
        if let nc = uiViewController.navigationController {
            self.configure(nc)
        }
    }

}


struct homeView_Previews: PreviewProvider {
    static var previews: some View {
        homeView()
    }
}
