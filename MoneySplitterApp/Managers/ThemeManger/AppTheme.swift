//
//  AppTheme.swift
//  MoneySplitterApp
//
//  Created by Misha Muchaidze on 07.02.25.
//

import SwiftUI

enum ThemeType: String, CaseIterable {
    case light = "Light"
    case dark = "Dark"
    case system = "System"
}

struct AppTheme {
    //MARK: - Colors
    
    let primarySelectedColor: Color
    let primaryDeselectedColor: Color
    let primaryBackgroundColor: Color
    let tabViewColor: Color
    let tabViewBackgroundColor: Color
    
    //MARK: - Properties
    
    @Environment(\.colorScheme) private var colorScheme
    
    //MARK: - Static Functions

    static let light = AppTheme(
        primarySelectedColor: AppColors.light.primarySelectedColor,
        primaryDeselectedColor: AppColors.light.primaryDeselectedColor,
        primaryBackgroundColor: AppColors.light.primaryBackgroundColor,
        tabViewColor: AppColors.light.tabViewColor,
        tabViewBackgroundColor: AppColors.light.tabViewBackgroundColor
    )
    static let dark = AppTheme(
        primarySelectedColor: AppColors.dark.primarySelectedColor,
        primaryDeselectedColor: AppColors.dark.primaryDeselectedColor,
        primaryBackgroundColor: AppColors.dark.primaryBackgroundColor,
        tabViewColor: AppColors.dark.tabViewColor,
        tabViewBackgroundColor: AppColors.dark.tabViewBackgroundColor
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
            colorScheme == .light ? .light : .dark
        }
    }
}
