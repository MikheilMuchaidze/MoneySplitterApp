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
                default:
                    break
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
            Spacer()
            List {
                ForEach(0..<50) { _ in
                    Text("SettingsView")
                        .font(.headline)
                }
            }
        }
        .navigationTitle("SettingsView")
        .transition(.scale)
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(8)
    }
}

#Preview {
    SettingsView()
        .environment(\.themeManager, ThemeManager())
}

struct SettingsViewDetails: View {
    var body: some View {
        Text("SettingsViewDetails")
    }
}
