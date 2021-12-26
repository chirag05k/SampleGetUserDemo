//
//  AppConstant.swift
//  TwitterAuthentication
//
//  Created by Chirag Vekariya on 22/12/21.
//

import Foundation

//App Level identifiers
typealias AppString         = R.string.appLocalizable
typealias AppIdentifiers    = R.reuseIdentifier
typealias AppStoryBoard     = R.storyboard

//App Constant
struct AppConstant {
    
    static let BaseURL                      = "https://randomuser.me/api/?results=20"
}

// MARK: - UserSettingKeys
struct UserSettingsKey {
    
    static let currentUser                  =  "kCurrentUser"
}
