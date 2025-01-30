//
//  GroupsTabCoordinatorEnvironmentKey.swift
//  MoneySplitterApp
//
//  Created by Mikheil Muchaidze on 31.01.25.
//

import SwiftUI

private struct GroupsTabCoordinatorEnvironmentKey: EnvironmentKey {
    static let defaultValue = GroupsTabCoordinator()
}

extension EnvironmentValues {
    var groupsTabCoordinator: GroupsTabCoordinator {
        get { self[GroupsTabCoordinatorEnvironmentKey.self] }
        set { self[GroupsTabCoordinatorEnvironmentKey.self] = newValue }
    }
}
