//
//  CommonMethod.swift
//  TwitterAuthentication
//
//  Created by Chirag Vekariya on 26/12/21.
//

import Foundation
import Network

class NetworkMonitor {
    static let shared = NetworkMonitor()
    
    let monitor = NWPathMonitor()
    private var status: NWPath.Status = .requiresConnection
    var isReachable: Bool = false
    
    func startMonitoring() {
        monitor.pathUpdateHandler = { [weak self] path in
            guard let uSelf = self else { return }
            uSelf.status = path.status
            uSelf.isReachable = path.status == .satisfied
        }
        
        let queue = DispatchQueue(label: "NetworkMonitor")
        monitor.start(queue: queue)
    }
    
}
