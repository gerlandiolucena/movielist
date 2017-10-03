//
//  ConfigurationProvider.swift
//  Movie List
//
//  Created by Gerlandio Da Silva Lucena on 02/10/17.
//  Copyright © 2017 GerlandioLucena. All rights reserved.
//

import UIKit

class ConfigurationProvider: NSObject {
    static var instance: ConfigurationProvider!
    
    var configurations: NSDictionary?
    var scheme: String?
    
    // SHARED INSTANCE
    class func sharedInstance() -> ConfigurationProvider {
        self.instance = (self.instance ?? ConfigurationProvider())
        
        if (self.instance.configurations == nil) {
            self.instance.getConfigurations()
        }
        
        return self.instance
    }
    
    //MARK: Private Methods
    
    private func getConfigurations() {
        if let path = Bundle.main.path(forResource: "Settings", ofType: "plist") {
            let fileURL = URL(fileURLWithPath: path, isDirectory: false)
            if let allData = NSDictionary(contentsOf: fileURL), let path = Bundle.main.path(forResource: nil, ofType: "plist") {
                let fileURL = URL(fileURLWithPath: path, isDirectory: false)
                if let currentBundleData = NSDictionary(contentsOf: fileURL) {
                    configurations = allData
                    let schemeLabel = currentBundleData.object(forKey: "SCHEME") ?? "devenv"
                    self.scheme = String(describing: schemeLabel)
                }
            }
        }
    }
    
    //MARK: - Public Methods
    func get<T>(tag: String) -> T? {
        
        if let value = configurations?.value(forKeyPath: tag) as? T {
            return value
        }
        
        return nil
    }
}
