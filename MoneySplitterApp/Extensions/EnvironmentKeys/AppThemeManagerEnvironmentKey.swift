//
//  AppThemeManagerEnvironmentKey.swift
//  MoneySplitterApp
//
//  Created by Mikheil Muchaidze on 31.01.25.
//

import SwiftUI

private struct ThemeManagerEnvironmentKey: EnvironmentKey {
    static let defaultValue: ThemeManagerProtocol = ThemeManager()
}

extension EnvironmentValues {
    var themeManager: ThemeManagerProtocol {
        get { self[ThemeManagerEnvironmentKey.self] }
        set { self[ThemeManagerEnvironmentKey.self] = newValue }
    }
}
