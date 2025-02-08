//
//  AppThemeManager.swift
//  MoneySplitterApp
//
//  Created by Mikheil Muchaidze on 31.01.25.
//

import SwiftUI

protocol ThemeManagerProtocol {
    var selectedTheme: ThemeType { get set }
    var activeTheme: AppTheme { get }

    func changeTheme(to theme: ThemeType)
    func changeThemeDuringSystemType(_ colorScheme: ColorScheme)
}

@Observable
final class ThemeManager: ThemeManagerProtocol {
    //MARK: - Properties
    
    var selectedTheme: ThemeType {
        didSet {
            UserDefaults.standard.set(selectedTheme.rawValue, forKey: "selectedTheme") // Persist selection
        }
    }

    var activeTheme: AppTheme
    
    //MARK: - Init

    init() {
        let savedTheme = ThemeType(rawValue: UserDefaults.standard.string(forKey: "selectedTheme") ?? "system") ?? .system
        self.selectedTheme = savedTheme
        self.activeTheme = AppTheme.getTheme(for: savedTheme, colorScheme: nil)
    }
    
    //MARK: - Functions

    func changeTheme(to theme: ThemeType) {
        selectedTheme = theme
        activeTheme = AppTheme.getTheme(for: theme, colorScheme: nil)
    }
    
    func changeThemeDuringSystemType(_ colorScheme: ColorScheme) {
        activeTheme = AppTheme.getTheme(for: .system, colorScheme: colorScheme)
    }
}
