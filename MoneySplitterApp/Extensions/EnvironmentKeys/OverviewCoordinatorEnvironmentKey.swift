//
//  OverviewCoordinatorEnvironmentKey.swift
//  MoneySplitterApp
//
//  Created by Mikheil Muchaidze on 31.01.25.
//

import SwiftUI

private struct OverviewsTabCoordinatorEnvironmentKey: EnvironmentKey {
    static let defaultValue = OverviewsTabCoordinator()
}

extension EnvironmentValues {
    var overviewTabCoordinator: OverviewsTabCoordinator {
        get { self[OverviewsTabCoordinatorEnvironmentKey.self] }
        set { self[OverviewsTabCoordinatorEnvironmentKey.self] = newValue }
    }
}
