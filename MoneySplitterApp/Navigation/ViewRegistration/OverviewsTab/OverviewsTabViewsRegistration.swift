//
//  OverviewsTabViewsRegistration.swift
//  MoneySplitterApp
//
//  Created by Mikheil Muchaidze on 30.01.25.
//

import SwiftUI

@MainActor
extension View {
    func registerViewsForCoordinatorOnOverviewsTab(_ coordinatorPath: any CoordinatorProtocol) -> some View {
        navigationDestination(for: OverviewsTabRoutes.self) { destination in
            switch destination {
            case .overviewDetails:
                OverviewDetails()
            }
        }
    }
}
