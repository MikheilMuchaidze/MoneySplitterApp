//
//  AppThemeManager.swift
//  MoneySplitterApp
//
//  Created by Mikheil Muchaidze on 31.01.25.
//

import SwiftUI

enum ThemeType: String, CaseIterable, Hashable {
    case light = "Light"
    case dark = "Dark"
    case system = "System"
}

struct AppTheme: Hashable {
    var primarySelectedColor: Color
    var primaryDeselectedColor: Color

    static let light = AppTheme(
        primarySelectedColor: .purple,
        primaryDeselectedColor: .white
    )
    static let dark = AppTheme(
        primarySelectedColor: .white,
        primaryDeselectedColor: .red
    )

    static func getTheme(
        for type: ThemeType,
        colorScheme: ColorScheme?
    ) -> AppTheme {
        switch type {
        case .light:
            return .light
        case .dark:
            return .dark
        case .system:
            if UITraitCollection.current.userInterfaceStyle == .light {
                return .light
            } else {
                return .dark
            }
//            return colorScheme == .dark ? .dark : .light
        }
    }
}

protocol ThemeManagerProtocol {
    var selectedTheme: ThemeType { get set }
    var activeTheme: AppTheme { get }

    func changeTheme(to theme: ThemeType)
}

@Observable
final class ThemeManager: ThemeManagerProtocol {
    var selectedTheme: ThemeType {
        didSet {
            UserDefaults.standard.set(selectedTheme.rawValue, forKey: "selectedTheme") // Persist selection
        }
    }

    var activeTheme: AppTheme

    init() {
        // Load saved theme or default to system
        let savedTheme = ThemeType(rawValue: UserDefaults.standard.string(forKey: "selectedTheme") ?? "system") ?? .system
        self.selectedTheme = savedTheme
        self.activeTheme = AppTheme.getTheme(for: savedTheme, colorScheme: nil)
    }

    func changeTheme(to theme: ThemeType) {
        selectedTheme = theme
        activeTheme = AppTheme.getTheme(for: theme, colorScheme: nil)
    }
}

