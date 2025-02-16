//
//  AppThemeManager.swift
//  MoneySplitterApp
//
//  Created by Mikheil Muchaidze on 31.01.25.
//

import SwiftUI

protocol ThemeManagerProtocol {
    var selectedTheme: ThemeType { get set }
    var selectedThemeIndex: Int { get set }
    var activeTheme: AppTheme { get }

    func changeTheme(to theme: ThemeType)
    func changeThemeDuringSystemType(_ colorScheme: ColorScheme)
}

@Observable
final class ThemeManager: ThemeManagerProtocol {
    //MARK: - Properties
    
    var selectedTheme: ThemeType = .system {
        didSet {
            selectedThemeStorage = selectedTheme.rawValue
            mapCurrentThemeToItsIndex()
        }
    }
    var selectedThemeIndex = 2
    var activeTheme: AppTheme = .light
    
    //MARK: - Storage Properties
    
    @ObservationIgnored @AppStorage(Constants.themeUserDefaultsKey) private var selectedThemeStorage = ThemeType.system.rawValue
    
    //MARK: - Init

    init() {
        let savedTheme = ThemeType(rawValue: selectedThemeStorage) ?? .system
        self.activeTheme = AppTheme.getTheme(for: savedTheme, colorScheme: nil)
        self.selectedTheme = savedTheme
    }
    
    //MARK: - Functions

    func changeTheme(to theme: ThemeType) {
        selectedTheme = theme
        activeTheme = AppTheme.getTheme(for: theme, colorScheme: nil)
    }
    
    func changeThemeDuringSystemType(_ colorScheme: ColorScheme) {
        activeTheme = AppTheme.getTheme(for: .system, colorScheme: colorScheme)
    }
    
    //MARK: - Private Functions
    
    private func mapCurrentThemeToItsIndex() {
        selectedThemeIndex = switch selectedTheme {
        case .light: 0
        case .dark: 1
        case .system: 2
        }
    }
}
