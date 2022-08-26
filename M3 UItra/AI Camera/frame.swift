//
//  frame.swift
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


class PoseEstimator: NSObject, AVCaptureVideoDataOutputSampleBufferDelegate, ObservableObject {
    let sequenceHandler = VNSequenceRequestHandler()
    @Published var bodyParts = [VNHumanBodyPoseObservation.JointName : VNRecognizedPoint]()
    var wasInBottomPosition = false
   
    @Published var squatCount = 0
    @Published var rightKneeconfidence = Float("")
    @Published var leftKneeconfidence = Float("")
    @Published var rightHipconfidence = Float("")
    @Published var rightAnkleconfidence = Float("")
    @Published var leftAnkleconfidence = Float("")
    
    @Published var rightKnee = CGPoint(x: 0, y: 0)
    @Published var rightAnkle = CGPoint(x: 0, y: 0)
    @Published var rightHip = CGPoint(x: 0, y: 0)
    @Published var angleOfRightLeg = Double(0)
    
    @Published var lefthip = CGPoint(x: 0, y: 0)
    @Published var leftKnee = CGPoint(x: 0, y: 0)
    @Published var leftAnkle = CGPoint(x: 0, y: 0)
    @Published var angleOfLeftLeg = Double(0)
    
    @Published var rightElbow = CGPoint(x: 0, y: 0)
    @Published var rightWrist = CGPoint(x: 0, y: 0)
    @Published var rightShoulder = CGPoint(x: 0, y: 0)
    @Published var angleOfRArm = Double(0)
    
    @Published var leftElbow = CGPoint(x: 0, y: 0)
    @Published var leftWrist = CGPoint(x: 0, y: 0)
    @Published var leftShoulder = CGPoint(x: 0, y: 0)
    @Published var angleOfLArm = Double(0)
    
    
    var subscriptions = Set<AnyCancellable>()
    
    override init() {
        super.init()
        $bodyParts
            .dropFirst()
            .sink(receiveValue: { bodyParts in self.countSquats(bodyParts: bodyParts)})
            .store(in: &subscriptions)
    }
    
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        let humanBodyRequest = VNDetectHumanBodyPoseRequest(completionHandler: detectedBodyPose)
        do {
            try sequenceHandler.perform(
              [humanBodyRequest],
              on: sampleBuffer,
                orientation: .right)
        } catch {
          //error
        }
    }
    func detectedBodyPose(request: VNRequest, error: Error?) {
        guard let bodyPoseResults = request.results as? [VNHumanBodyPoseObservation]
          else { return }
        guard let bodyParts = try? bodyPoseResults.first?.recognizedPoints(.all) else { return }
        DispatchQueue.main.async {
            self.bodyParts = bodyParts
        }
    }
    
    func countSquats(bodyParts: [VNHumanBodyPoseObservation.JointName : VNRecognizedPoint]) {
        
//        let confendent = bodyParts.
        
        
        rightHip = bodyParts[.rightHip]!.location
        rightKnee = bodyParts[.rightKnee]!.location
        rightAnkle = bodyParts[.rightAnkle]!.location
        
        lefthip = bodyParts[.leftHip]!.location
        leftKnee = bodyParts[.leftKnee]!.location
        leftAnkle = bodyParts[.leftAnkle]!.location
        
        
        rightShoulder = bodyParts[.rightShoulder]!.location
        rightElbow = bodyParts[.rightElbow]!.location
        rightWrist = bodyParts[.rightWrist]!.location
        
        leftShoulder = bodyParts[.leftShoulder]!.location
        leftElbow = bodyParts[.leftElbow]!.location
        leftWrist = bodyParts[.leftWrist]!.location
        
        
        rightKneeconfidence = bodyParts[.rightKnee]!.confidence
        leftKneeconfidence = bodyParts[.rightKnee]!.confidence
        rightHipconfidence = bodyParts[.rightHip]!.confidence
        rightAnkleconfidence = bodyParts[.rightAnkle]!.confidence
        leftAnkleconfidence = bodyParts[.leftAnkle]!.confidence
        
    
        
        let firstAngle = atan2(rightHip.y - rightKnee.y, rightHip.x - rightKnee.x)
        let secondAngle = atan2(rightAnkle.y - rightKnee.y, rightAnkle.x - rightKnee.x)
        var angleDiffRadians = firstAngle - secondAngle
        while angleDiffRadians < 0 {
                    angleDiffRadians += CGFloat(2 * Double.pi)
                }
        let angleDiffDegrees = Int(angleDiffRadians * 180 / .pi)
        if angleDiffDegrees > 150 && self.wasInBottomPosition {
            self.squatCount += 1
            self.wasInBottomPosition = false
        }
        
        let hipHeight = rightHip.y
        let kneeHeight = rightKnee.y
        if hipHeight < kneeHeight {
            self.wasInBottomPosition = true
        }
        
        
        
    }

}

