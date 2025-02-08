//
//  View+TabViewsRegistration.swift
//  MoneySplitterApp
//
//  Created by Mikheil Muchaidze on 30.01.25.
//

import SwiftUI

@MainActor
extension View {
    func registerViewsFor<T: NavigationPathProtocol>(navigationPaths: [T]) -> some View {
        ForEach(navigationPaths, id: \.id) { _ in
            navigationDestination(for: T.self) { destination in
                switch destination {
                case let overviewDestination as OverviewsTabRoutes:
                    switch overviewDestination {
                    case .overviewDetails:
                        OverviewDetails()
                    }
                case let groupsDestination as GroupsTabRoutes:
                    switch groupsDestination {
                    case .groupsDetails:
                        GroupsViewDetails()
                    }
                case let settingsDestination as SettingsTabRoutes:
                    switch settingsDestination {
                    case .settingsDetails:
                        SettingsViewDetails()
                    }
                default:
                    EmptyView()
                }
            }
        }
    }
}
