//
//  ThemeManager.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 10/02/2022.
//

import UIKit

class ThemeManager: NSObject {
    
    // MARK: - Properties
    
    static let standard = ThemeManager()
    let userDefaultsHelper = UserDefaultsHelper()
    var isSetup: Bool = false
    
    // MARK: - Initialization
    
    override private init() {
        super.init()
    }
    
    deinit {
        userDefaultsHelper.removeValueObserver(observer: self, for: "theme")
    }
    
    // MARK: - Setup Methods
    
    func setup() {
        isSetup = true
        userDefaultsHelper.addValueObserver(observer: self, for: "theme", options: [.new])
    }
    
    // MARK: - Observer Methods
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        guard let change = change, object != nil, keyPath == "theme" else { return }
        if let newTheme = Theme(rawValue: change[.newKey] as! String) {
            ThemeManager.standard.applyTheme(theme: newTheme)
        }
    }
    
    // MARK: - Theme Application Methods
    
    func applyTheme(theme: Theme) {
        switch theme {
        case .followSystem: applySystemTheme()
        case .light: applyLightTheme()
        case .dark: applyDarkTheme()
        }
    }
    
    func applyPreferedTheme() {
        if let value = try? userDefaultsHelper.getValue(for: "theme").get() as? String, let theme = Theme(rawValue: value) {
            switch theme {
            case .followSystem: applySystemTheme()
            case .light: applyLightTheme()
            case .dark: applyDarkTheme()
            }
        }
    }
    
    private func applySystemTheme() {
        if let window = UIApplication.keyWindow() {
            window.overrideUserInterfaceStyle = .unspecified
        }
    }
    
    private func applyLightTheme() {
        if let window = UIApplication.keyWindow() {
            window.overrideUserInterfaceStyle = .light
        }
    }
    
    private func applyDarkTheme() {
        if let window = UIApplication.keyWindow() {
            window.overrideUserInterfaceStyle = .dark
        }
    }
    
}
