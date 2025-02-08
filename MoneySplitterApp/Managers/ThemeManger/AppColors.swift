//
//  AppColors.swift
//  MoneySplitterApp
//
//  Created by Misha Muchaidze on 06.02.25.
//

import SwiftUI

enum AppColors {}

extension AppColors {
    enum light {
        // darkviolet
        static let primarySelectedColor = Color.fromRGB(
            red: 148,
            green: 0,
            blue: 211
        )
        // ghostwhite
        static let primaryDeselectedColor = Color.fromRGB(
            red: 248,
            green: 248,
            blue: 255
        )
        // silver
        static let primaryBackgroundColor = Color.fromRGB(
            red: 192,
            green: 192,
            blue: 192
        )
        // black
        static let tabViewColor = Color.fromRGB(
            red: 0,
            green: 0,
            blue: 0
        )
        //
        static let tabViewBackgroundColor = Color.fromRGB(
            red: 77.0,
            green: 59.0,
            blue: 57.0
        )
    }
}

extension AppColors {
    enum dark {
        // darkviolet
        static let primarySelectedColor = Color.fromRGB(
            red: 148,
            green: 0,
            blue: 211
        )
        // black
        static let primaryDeselectedColor = Color.fromRGB(
            red: 0,
            green: 0,
            blue: 0
        )
        // silver
        static let primaryBackgroundColor = Color.fromRGB(
            red: 192,
            green: 192,
            blue: 192
        )
        // ghostwhite
        static let tabViewColor = Color.fromRGB(
            red: 248,
            green: 248,
            blue: 255
        )
        //
        static let tabViewBackgroundColor = Color.fromRGB(
            red: 77.0,
            green: 59.0,
            blue: 57.0
        )
    }
}
