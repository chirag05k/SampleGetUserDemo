//
//  UserManager.swift
//  TwitterAuthentication
//
//  Created by Chirag Vekariya on 26/12/21.
//

import Foundation

class MapManager: NSObject {
    
    // MARK: -
    // MARK: - Variable
    private let userDefaults = UserDefaults.standard
    
    static var shared: MapManager {
        return MapManager()
    }
    
    var currentUser: [UserInfo] {
        get {
            return userDefaults.value([UserInfo].self, forKey: UserSettingsKey.currentUser) ?? []
        } set (newValue) {
            userDefaults.set(encodable: newValue, forKey: UserSettingsKey.currentUser)
            userDefaults.synchronize()
        }
    }
    
}
