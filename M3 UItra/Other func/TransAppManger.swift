//
//  TransAppManger.swift
//  AI教你做運動
//
//  Created by HingTatTsang on 30/8/2022.
//

import Foundation
import MultipeerConnectivity

class RemoteConnectionManager: NSObject, ObservableObject {
  private static let service = "datatrans"

  @Published var messages: [RemoteMessage] = []
  @Published var peers: [MCPeerID] = []
  @Published var connectedToRemote = false
  @Published var isHosting = false
  let myPeerId = MCPeerID(displayName: UIDevice.current.name)
  private var advertiserAssistant: MCNearbyServiceAdvertiser?
  private var session: MCSession?

  func send(_ message: String) {
      let RemoteMessage = RemoteMessage(displayName: myPeerId.displayName, body: message)
      messages.append(RemoteMessage)
      guard
        let session = session,
        let data = message.data(using: .utf8),
        !session.connectedPeers.isEmpty
      else { return }

      do {
        try session.send(data, toPeers: session.connectedPeers, with: .reliable)
      } catch {
            
      }
  }
  func join() {
      peers.removeAll()
      messages.removeAll()
      session = MCSession(peer: myPeerId, securityIdentity: nil, encryptionPreference: .required)
      session?.delegate = self
      guard let firstScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return
      }

      guard let firstWindow = firstScene.windows.first else {
            return
      }
      guard
        let session = session
      else { return }

      let mcBrowserViewController = MCBrowserViewController(serviceType: RemoteConnectionManager.service, session: session)
      mcBrowserViewController.delegate = self
      firstWindow.rootViewController?.present(mcBrowserViewController, animated: true)
  }

  func host() {
      isHosting = true
      peers.removeAll()
      messages.removeAll()
      connectedToRemote = true
      session = MCSession(peer: myPeerId, securityIdentity: nil, encryptionPreference: .required)
      session?.delegate = self
      advertiserAssistant = MCNearbyServiceAdvertiser(
        peer: myPeerId,
        discoveryInfo: nil,
        serviceType: RemoteConnectionManager.service)
      advertiserAssistant?.delegate = self
      advertiserAssistant?.startAdvertisingPeer()
  }

  func leaveRemote() {
      isHosting = false
      connectedToRemote = false
      advertiserAssistant?.stopAdvertisingPeer()
      messages.removeAll()
      session = nil
      advertiserAssistant = nil
  }
}

extension RemoteConnectionManager: MCNearbyServiceAdvertiserDelegate {
  func advertiser(_ advertiser: MCNearbyServiceAdvertiser, didReceiveInvitationFromPeer peerID: MCPeerID, withContext context: Data?, invitationHandler: @escaping (Bool, MCSession?) -> Void) {
      invitationHandler(true, session)
  }
}

extension RemoteConnectionManager: MCSessionDelegate {
  func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
      guard let message = String(data: data, encoding: .utf8) else { return }
      let RemoteMessage = RemoteMessage(displayName: peerID.displayName, body: message)
      DispatchQueue.main.async {
        self.messages.append(RemoteMessage)
      }
  }

  func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
      switch state {
      case .connected:
        if !peers.contains(peerID) {
            DispatchQueue.main.async {
              self.peers.insert(peerID, at: 0)
            }
        }
      case .notConnected:
        DispatchQueue.main.async {
            if let index = self.peers.firstIndex(of: peerID) {
              self.peers.remove(at: index)
            }
            if self.peers.isEmpty && !self.isHosting {
              self.connectedToRemote = false
            }
        }
      case .connecting:
        NSLog("\(peerID.displayName)")
      @unknown default:
        NSLog("Unknown state: \(state)")
      }
  }

  func session(_ session: MCSession, didReceive stream: InputStream, withName streamName: String, fromPeer peerID: MCPeerID) {}

  func session(_ session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, with progress: Progress) {
  }

  func session(_ session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, at localURL: URL?, withError error: Error?) {
      guard
        let localURL = localURL,
        let data = try? Data(contentsOf: localURL),
        let messages = try? JSONDecoder().decode([RemoteMessage].self, from: data)
      else { return }

      DispatchQueue.main.async {
        self.messages.insert(contentsOf: messages, at: 0)
      }
  }
}

extension RemoteConnectionManager: MCBrowserViewControllerDelegate {
  func browserViewControllerDidFinish(_ browserViewController: MCBrowserViewController) {
      browserViewController.dismiss(animated: true) {
        self.connectedToRemote = true
      }
  }

  func browserViewControllerWasCancelled(_ browserViewController: MCBrowserViewController) {
      session?.disconnect()
      browserViewController.dismiss(animated: true)
  }
}
