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
        
    @State private var selectedIndex: Int
    let segments = ThemeType.allCases.map { $0.rawValue }
    
    init(selectedIndex: Int) {
        self.selectedIndex = selectedIndex
    }
    
    var body: some View {
        VStack {
            CustomSegmentedPicker(
                selectedIndex: $selectedIndex,
                segments: segments,
                textColor: themeManager.activeTheme.primaryDeselectedColor,
                selectedSegmentBackgroundColor: themeManager.activeTheme.primarySelectedColor,
                unselectedSegmentBackgroundColor: themeManager.activeTheme.primaryBackgroundColor,
                onSegmentChange: {
                    changeTheme()
                }
            )
            
            Spacer()
        }
        .navigationTitle("SettingsView")
        .transition(.scale)
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(8)
    }
    
    //MARK: - Privet Functions
    
    func changeTheme() {
        switch selectedIndex {
        case 0:
            themeManager.changeTheme(to: .light)
        case 1:
            themeManager.changeTheme(to: .dark)
        case 2:
            themeManager.changeTheme(to: .system)
        default:
            break
        }
    }
}

#Preview {
    SettingsView(selectedIndex: ThemeManager().selectedThemeIndex)
        .environment(\.themeManager, ThemeManager())
}

struct SettingsViewDetails: View {
    var body: some View {
        Text("SettingsViewDetails")
    }
}
