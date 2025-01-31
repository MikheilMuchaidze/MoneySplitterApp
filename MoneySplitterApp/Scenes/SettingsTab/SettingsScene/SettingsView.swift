//
//  SettingsView.swift
//  MoneySplitterApp
//
//  Created by Mikheil Muchaidze on 30.01.25.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.settingsTabCoordinator) private var coordinator
    @Environment(\.themeManager) private var themeManager

    var body: some View {
        VStack {
            Picker("Theme?", selection: .init(get: {
                themeManager.selectedTheme
            }, set: { selectedIndex in
                switch selectedIndex {
                case .light:
                    themeManager.changeTheme(to: .light)
                case .dark:
                    themeManager.changeTheme(to: .dark)
                case .system:
                    themeManager.changeTheme(to: .system)
                }
            })) {
                Text("Light")
                    .tag(ThemeType.light)
                Text("Dark")
                    .tag(ThemeType.dark)
                Text("System")
                    .tag(ThemeType.system)
            }
            .pickerStyle(.segmented)

            Text("SettingsView")
                .font(.headline)
            Spacer()
        }
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(8)
    }
}

#Preview {
    SettingsView()
        .environment(\.themeManager, ThemeManager())
}
