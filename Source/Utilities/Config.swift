//
//  Config.swift
//  Main
//
//  Created by Nanda Julianda Akbar on 28/03/23.
//

import Foundation

fileprivate enum ConfigKeys: String {
    case appName = "CFBundleDisplayName"
    case appBundleID = "CFBundleIdentifier"
    case appVersion = "CFBundleShortVersionString"
    case baseApiURL = "ApiURL"
}

fileprivate final class PlistUtils {
    
    private init() {}
    
    static func getValue(from key: ConfigKeys) -> String {
        
        guard let info = Bundle.main.infoDictionary else {
            fatalError("Plist file not found")
        }
        
        guard let value = info[key.rawValue] as? String else {
            fatalError("\(key)'s not set in plist file")
        }
        
        return value
    }
    
}

internal enum Config {
    
    static let appName = PlistUtils.getValue(from: ConfigKeys.appName)
    static let appVersion = PlistUtils.getValue(from: ConfigKeys.appVersion)
    static let appBundleID = PlistUtils.getValue(from: ConfigKeys.appBundleID)
    static let baseApiURL = PlistUtils.getValue(from: ConfigKeys.baseApiURL)
    
}
