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
    var primaryBackgroundColor: Color
    var tabViewColor: Color

    static let light = AppTheme(
        primarySelectedColor: .purple,
        primaryDeselectedColor: .white,
        primaryBackgroundColor: .gray.opacity(0.1),
        tabViewColor: .black
    )
    static let dark = AppTheme(
        primarySelectedColor: .purple,
        primaryDeselectedColor: .black,
        primaryBackgroundColor: .gray.opacity(0.1),
        tabViewColor: .white
    )

    static func getTheme(
        for type: ThemeType,
        colorScheme: ColorScheme?
    ) -> AppTheme {
        switch type {
        case .light:
                .light
        case .dark:
                .dark
        case .system:
            if UITraitCollection.current.userInterfaceStyle == .light {
                .light
            } else {
                .dark
            }
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
