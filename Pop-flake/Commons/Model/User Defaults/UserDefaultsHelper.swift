//
//  UserDefaultsHelper.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 10/02/2022.
//

import Foundation
import InAppSettingsKit

class UserDefaultsHelper {
    
    private let userDefaults = UserDefaults.standard
    
    // MARK: - Setup Methods
    
    func setup() {
        let settingsReader = IASKSettingsReader()
        let defaultDict = settingsReader.gatherDefaultsLimited(toEditableFields: true)
        userDefaults.register(defaults: defaultDict)
    }
    
    // MARK: - Defaults Registeration Methods
    
    func register(defaults: [String : Any]) {
        userDefaults.register(defaults: defaults)
    }
    
    // MARK: - Writing and Reading Methods
    
    func setValue(value: Any, for key: String) {
        userDefaults.set(value, forKey: key)
    }
        
    func getValue(for key: String) -> Result<Any,UserDefaultsError> {
        if let value = userDefaults.object(forKey: key) {
            return .success(value)
        }
        return .failure(.propertyNotFound)
    }
    
    // MARK: - Value Observer Methods
        
    func addValueObserver(observer: NSObject, for key: String, options: NSKeyValueObservingOptions) {
        userDefaults.addObserver(observer, forKeyPath: key, options: options, context: nil)
    }
        
    func removeValueObserver(observer: NSObject, for key: String) {
        userDefaults.removeObserver(observer, forKeyPath: key)
    }
    
    // MARK: - Clear Methods
    
    func clear() {
        userDefaults.removeObject(forKey: "theme")
    }
    
}

extension UserDefaultsHelper {
    
    var themeKey: Theme? {
        get {
            if let rawValue = UserDefaults.standard.string(forKey: "theme") {
                return Theme(rawValue: rawValue)
            }
            return nil
        }
        set(theme) {
            let rawValue = theme?.rawValue
            UserDefaults.standard.set(rawValue, forKey: "theme")
        }
    }
    
}

