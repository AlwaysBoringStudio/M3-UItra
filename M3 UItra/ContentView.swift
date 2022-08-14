//
//  ContentView.swift
//  M3 UItra
//
//  Created by M2 Ultra on 11/8/2022.
//

import SwiftUI
import Foundation
import AVFoundation
import Vision
import Combine
import UIKit

struct ContentView: View {
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    var body: some View {
//        NavigationView {
//            List {
//                NavigationLink(destination: aiView()) {
//                    Text("AI")
//                }
//                NavigationLink(destination: game1view()) {
//                    Text("Game1")
//                }
//                .navigationTitle("AI教你做運動")
//                .navigationViewStyle(.stack)
//            }
//        }
        aiView()

        
    }
}


struct aiView: View {
    @StateObject var poseEstimator = PoseEstimator()
    
    let timer = Timer.publish(every: 0.001, on: .main, in: .common).autoconnect()
  
    @State var x11 = CGFloat(0)
    @State var y11 = CGFloat(0)
    @State var x12 = CGFloat(0)
    @State var y12 = CGFloat(0)
    @State var x13 = CGFloat(0)
    @State var y13 = CGFloat(0)
    @State var no1 = Double(0)
    @State var slope1 = Double(0)
    @State var slope2 = Double(0)
    @State var x24 = CGFloat(0)
    @State var y24 = CGFloat(0)
    @State var x25 = CGFloat(0)
    @State var y25 = CGFloat(0)
    @State var x26 = CGFloat(0)
    @State var y26 = CGFloat(0)
    @State var no2 = Double(0)
    @State var slope3 = Double(0)
    @State var slope4 = Double(0)
    @State var x31 = CGFloat(0)
    @State var y31 = CGFloat(0)
    @State var x32 = CGFloat(0)
    @State var y32 = CGFloat(0)
    @State var x33 = CGFloat(0)
    @State var y33 = CGFloat(0)
    @State var no3 = Double(0)
    @State var slope5 = Double(0)
    @State var slope6 = Double(0)
    @State var x44 = CGFloat(0)
    @State var y44 = CGFloat(0)
    @State var x45 = CGFloat(0)
    @State var y45 = CGFloat(0)
    @State var x46 = CGFloat(0)
    @State var y46 = CGFloat(0)
    @State var no4 = Double(0)
    @State var slope7 = Double(0)
    @State var slope8 = Double(0)
    //let the var of formula angle
    
    var body: some View {
        VStack {
            ZStack {
                GeometryReader { geo in
                    CameraViewWrapper(poseEstimator: poseEstimator)
                    StickFigureView(poseEstimator: poseEstimator, size: geo.size)
                    
                }
            }
            
            HStack {
                VStack {
                    if poseEstimator.rightKneeconfidence != nil {
                      //   let rightKneeconfidenceString: String = String(format: "%.1f", poseEstimator.rightKneeconfidence!)
                      //   let leftKneeconfidenceString: String = String(format: "%.1f", poseEstimator.leftKneeconfidence!)
                      //   let rightHipconfidenceString: String = String(format: "%.1f", poseEstimator.rightHipconfidence!)
//                         let rightAnkleconfidenceString: String = String(format: "%.1f", poseEstimator.rightAnkleconfidence!)
//                         let leftAnkleconfidenceString: String = String(format: "%.1f", poseEstimator.leftAnkleconfidence!)
                         
                         
                         //Text("rightKneeconfidence:\(rightKneeconfidenceString)").font(.title)
                         //Text("leftKneeconfidence:\(leftKneeconfidenceString)").font(.title)
                        // Text("rightHipconfidence:\(rightHipconfidenceString)").font(.title)
                        // Text("rightAnkleconfidence:\(rightAnkleconfidenceString)").font(.title)
                        // Text("leftAnkleconfidence:\(leftAnkleconfidenceString)").font(.title)
                        
//                        let qx1 = poseEstimator.rightAnkle.x
//                        let qy1 = poseEstimator.rightAnkle.y
//                        let qx2 = poseEstimator.rightKnee.x
//                        let qy2 = poseEstimator.rightKnee.y
//                        let qx3 = poseEstimator.rightHip.x
//                        let qy3 = poseEstimator.rightHip.y
                        
                        //Text("\(qx1), \(qx2), \(qx3), \(qy1), \(qy2), \(qy3)")
                        //    .font(.largeTitle)
                        
                        Text("左腳角度\(poseEstimator.angleOfRightLeg)").font(.largeTitle)
                        Text("右腳角度\(poseEstimator.angleOfLeftLeg)").font(.largeTitle)
                        Text("右手角度\(poseEstimator.angleOfRArm)").font(.largeTitle)
                        Text("左手角度\(poseEstimator.angleOfLArm)").font(.largeTitle)
                         
                     } else {
                         Text("左腳角度\(" nil")").font(.largeTitle)
                         Text("右腳角度\(" nil")").font(.largeTitle)
                         Text("右手角度\(" nil")").font(.largeTitle)
                         Text("左手角度\(" nil")").font(.largeTitle)
                         
                         
                         
                     }
                }
            }
            
        }
        .onReceive(timer) { time in
            
            x11 = poseEstimator.rightAnkle.x
            y11 = poseEstimator.rightAnkle.y
            x12 = poseEstimator.rightKnee.x
            y12 = poseEstimator.rightKnee.y
            x13 = poseEstimator.rightHip.x
            y13 = poseEstimator.rightHip.y
            
            slope1 = ((y11-y12)/(x11-x12))
            slope2 = ((y12-y13)/(x12-x13))
            
            no1 = (slope1-slope2)/(1+slope1*slope2)
           
            
            if no1 < 0 {
                 poseEstimator.angleOfRightLeg = 180 - atan(no1)/0.0174532925
            } else {
                 poseEstimator.angleOfRightLeg = atan(no1)/0.0174532925
            }
            
            
            
            
            x24 = poseEstimator.leftAnkle.x
            y24 = poseEstimator.leftAnkle.y
            x25 = poseEstimator.leftKnee.x
            y25 = poseEstimator.leftKnee.y
            x26 = poseEstimator.lefthip.x
            y26 = poseEstimator.lefthip.y

            slope3 = ((y24-y25)/(x24-x25))
            slope4 = ((y25-y26)/(x25-x26))
            
            no2 = (slope3-slope4)/(1+slope3*slope4)
        
            if no2 > 0 {
                poseEstimator.angleOfLeftLeg = 180 - atan(no2)/0.0174532925
            } else {
                poseEstimator.angleOfLeftLeg = atan(no2)/0.0174532925
            }
            
            
            
            
            x31 = poseEstimator.rightWrist.x
            y31 = poseEstimator.rightWrist.y
            x32 = poseEstimator.rightElbow.x
            y32 = poseEstimator.rightElbow.y
            x33 = poseEstimator.rightShoulder.x
            y33 = poseEstimator.rightShoulder.y
            
            slope5 = ((y31-y32)/(x31-x32))
            slope6 = ((y32-y33)/(x32-x33))
            
            no3 = (slope5-slope6)/(1+slope5*slope6)
                        
            if no3 < 0 {
                poseEstimator.angleOfRArm = 180 - atan(no3)/0.0174532925
            } else {
                poseEstimator.angleOfRArm = atan(no3)/0.0174532925
            }
            
            
            
            
            x44 = poseEstimator.leftShoulder.x
            y44 = poseEstimator.leftShoulder.y
            x45 = poseEstimator.leftWrist.x
            y45 = poseEstimator.leftWrist.y
            x46 = poseEstimator.leftElbow.x
            y46 = poseEstimator.leftElbow.y

            slope7 = ((y44-y45)/(x44-x45))
            slope8 = ((y45-y46)/(x45-x46))
            
            no4 = (slope7-slope8)/(1+slope7*slope8)
            
            if no4 > 0 {
                poseEstimator.angleOfLArm = 180 - atan(no4)/0.0174532925
            } else {
                poseEstimator.angleOfLArm = atan(no4)/0.0174532925
            }
        }
        
        
    }
    func calc() {
        var input: Double
        var result: Int
        let inputint = Int(input)
        let n = (inputint/Int(5))
        result = n*5

    }
}





struct Previews_ContentView_Previews: PreviewProvider {
    static var previews: some View {
        aiView()
    }
}
