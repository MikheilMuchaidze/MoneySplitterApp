//
//  MoneySplitterAppApp.swift
//  MoneySplitterApp
//
//  Created by Misha Muchaidze on 26.01.25.
//

import SwiftUI

@main
struct MoneySplitterAppApp: App {
    //MARK: - Properties
    
    @State private var themeManager = ThemeManager()

    //MARK: - Main Body
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.themeManager, themeManager)
        }
    }
}
