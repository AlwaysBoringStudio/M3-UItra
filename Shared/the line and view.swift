//
//  the line and view.swift
//  M3 UItra
//
//  Created by M2 Ultra on 11/8/2022.
//
import SwiftUI
import AVFoundation
import Vision
import Combine
import UIKit

struct Stick: Shape {
    var points: [CGPoint]
    var size: CGSize
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: points[0])
        for point in points {
            path.addLine(to: point)
        }
        return path.applying(CGAffineTransform.identity.scaledBy(x: size.width, y: size.height))
            .applying(CGAffineTransform(scaleX: -1, y: -1).translatedBy(x: -size.width, y: -size.height))
    }
}

struct StickFigureView: View {
    
    @StateObject var poseEstimator = PoseEstimator()
    var size: CGSize
    
    var body: some View {
        Group {
            if poseEstimator.bodyParts.isEmpty == false {
                ZStack {
                    if poseEstimator.rightKneeconfidence ?? 0 >= 0.5 {
                        
                        // Right leg
                        Stick(points: [poseEstimator.bodyParts[.rightAnkle]!.location, poseEstimator.bodyParts[.rightKnee]!.location, poseEstimator.bodyParts[.rightHip]!.location,
                        poseEstimator.bodyParts[.root]!.location], size: size)
                        .stroke(lineWidth: 7.0)
                        .fill(Color.red)
                    
                            
                    } else {
                        VStack {
                            Spacer()
                            HStack {
                                Spacer()
                                Image("body")
                                    .resizable()
                                    .scaledToFit()
                                Spacer()
                            }
                            Spacer()
                        }
                    }
                    if poseEstimator.leftKneeconfidence ?? 0 >= 0.5 {
                        // Left leg
                        Stick(points: [poseEstimator.bodyParts[.leftAnkle]!.location, poseEstimator.bodyParts[.leftKnee]!.location, poseEstimator.bodyParts[.leftHip]!.location,
                                       poseEstimator.bodyParts[.root]!.location], size: size)
                            .stroke(lineWidth: 7.0)
                            .fill(Color.red)
                        
                    } else {
                        VStack {
                            Spacer()
                            HStack {
                                Spacer()
                                Image("body")
                                    .resizable()
                                    .scaledToFit()
                                Spacer()
                            }
                            Spacer()
                        }
                            
                    }
                    if poseEstimator.rightHipconfidence ?? 0 >= 0.5 {
                        // Root to nose
                        Stick(points: [poseEstimator.bodyParts[.root]!.location,
                                       poseEstimator.bodyParts[.neck]!.location,  poseEstimator.bodyParts[.nose]!.location], size: size)
                            .stroke(lineWidth: 7.0)
                            .fill(Color.yellow)
                    } else {
                        VStack {
                            Spacer()
                            HStack {
                                Spacer()
                                Image("body")
                                    .resizable()
                                    .scaledToFit()
                                Spacer()
                            }
                            Spacer()
                        }
                            
                    }
                    if poseEstimator.rightAnkleconfidence ?? 0 >= 0.5 {
                        // Right arm
                        Stick(points: [poseEstimator.bodyParts[.rightWrist]!.location, poseEstimator.bodyParts[.rightElbow]!.location, poseEstimator.bodyParts[.rightShoulder]!.location, poseEstimator.bodyParts[.neck]!.location], size: size)
                            .stroke(lineWidth: 7.0)
                            .fill(Color.green)
                    } else {
                        VStack {
                            Spacer()
                            HStack {
                                Spacer()
                                Image("body")
                                    .resizable()
                                    .scaledToFit()
                                Spacer()
                            }
                            Spacer()
                        }
                            
                    }
                    if poseEstimator.leftAnkleconfidence ?? 0 >= 0.5 {
                        // Left arm
                        Stick(points: [poseEstimator.bodyParts[.leftWrist]!.location, poseEstimator.bodyParts[.leftElbow]!.location, poseEstimator.bodyParts[.leftShoulder]!.location, poseEstimator.bodyParts[.neck]!.location], size: size)
                            .stroke(lineWidth: 7.0)
                            .fill(Color.green)
                    } else {
                        VStack {
                            Spacer()
                            HStack {
                                Spacer()
                                Image("body")
                                    .resizable()
                                    .scaledToFit()
                                Spacer()
                            }
                            Spacer()
                        }
                    }
                    
                }
                
                
            } else {
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Image("body")
                            .resizable()
                            .scaledToFit()
                        Spacer()
                    }
                    Spacer()
                }
                    
            }
        }
    }
}


extension CGPoint {
    func distance(to point: CGPoint) -> CGFloat {
        return sqrt(pow(x - point.x, 2) + pow(y - point.y, 2))
    }
}
