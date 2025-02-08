//
//  Color+Extensions.swift
//  MoneySplitterApp
//
//  Created by Misha Muchaidze on 08.02.25.
//

import SwiftUI

extension Color {
    static func fromRGB(
        red: Double,
        green: Double,
        blue: Double,
        opacity: Double = 1.0
    ) -> Color {
        Color(
            red: red / 255,
            green: green / 255,
            blue: blue / 255,
            opacity: opacity
        )
    }
}
