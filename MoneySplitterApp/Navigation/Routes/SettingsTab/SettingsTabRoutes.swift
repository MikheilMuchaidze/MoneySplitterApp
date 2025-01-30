//
//  SettingsTabRoutes.swift
//  MoneySplitterApp
//
//  Created by Mikheil Muchaidze on 30.01.25.
//

import Foundation

enum SettingsTabRoutes: NavigationPathProtocol {
    case settingsDetails

    var id: String {
        switch self {
        case .settingsDetails:
            "settingsDetails"
        }
    }
}
