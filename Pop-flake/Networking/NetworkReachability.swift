//
//  NetworkReachability.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 08/02/2022.
//

import Network

class ReachabilityHelper {
    
    let wifiMonitor: NWPathMonitor!
    let cellularMonitor: NWPathMonitor!
    let ethernetMonitor: NWPathMonitor!
    let queue: DispatchQueue!
    
    var isWifiConnected: Bool = false
    var isCellularConnected: Bool = false
    var isEthernetConnected: Bool = false
    var isInternetConnected: Bool { return isWifiConnected || isCellularConnected || isEthernetConnected }
    
    init() {
        wifiMonitor = NWPathMonitor(requiredInterfaceType: .wifi)
        cellularMonitor = NWPathMonitor(requiredInterfaceType: .cellular)
        ethernetMonitor = NWPathMonitor(requiredInterfaceType: .wiredEthernet)
        queue = DispatchQueue.global(qos: .background)
        setup()
    }

    private func setup() {
        wifiMonitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                self.isWifiConnected = true
            } else {
                self.isWifiConnected = false
            }
            DispatchQueue.main.async {
                if self.isWifiConnected || self.isCellularConnected || self.isEthernetConnected {
                    AlertHelper.dismissStatusBarBanner()
                } else {
                    AlertHelper.showStatusBarBanner(alert: .noInternet)
                }
            }
        }
        cellularMonitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                self.isCellularConnected = true
            } else {
                self.isCellularConnected = false
            }
            DispatchQueue.main.async {
                if self.isWifiConnected || self.isCellularConnected || self.isEthernetConnected {
                    AlertHelper.dismissStatusBarBanner()
                } else {
                    AlertHelper.showStatusBarBanner(alert: .noInternet)
                }
            }
        }
        ethernetMonitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                self.isEthernetConnected = true
            } else {
                self.isEthernetConnected = false
            }
            DispatchQueue.main.async {
                if self.isWifiConnected || self.isCellularConnected || self.isEthernetConnected {
                    AlertHelper.dismissStatusBarBanner()
                } else {
                    AlertHelper.showStatusBarBanner(alert: .noInternet)
                }
            }
        }
        
        wifiMonitor.start(queue: queue)
        cellularMonitor.start(queue: queue)
        ethernetMonitor.start(queue: queue)
    }
    
}
