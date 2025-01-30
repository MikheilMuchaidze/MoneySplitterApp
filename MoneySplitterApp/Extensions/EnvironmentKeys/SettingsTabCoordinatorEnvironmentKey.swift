//
//  SettingsTabCoordinatorEnvironmentKey.swift
//  MoneySplitterApp
//
//  Created by Mikheil Muchaidze on 31.01.25.
//

import SwiftUI

private struct SettingsTabCoordinatorEnvironmentKey: EnvironmentKey {
    static let defaultValue = SettingsTabCoordinator()
}

extension EnvironmentValues {
    var settingsTabCoordinator: SettingsTabCoordinator {
        get { self[SettingsTabCoordinatorEnvironmentKey.self] }
        set { self[SettingsTabCoordinatorEnvironmentKey.self] = newValue }
    }
}
