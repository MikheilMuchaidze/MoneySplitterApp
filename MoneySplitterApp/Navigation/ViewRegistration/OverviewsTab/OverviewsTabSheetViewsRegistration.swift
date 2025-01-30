//
//  OverviewsTabSheetViewsRegistration.swift
//  MoneySplitterApp
//
//  Created by Mikheil Muchaidze on 30.01.25.
//

import SwiftUI

@MainActor
extension View {
    func registerSheetViewsForCoordinatorOnOverviewsTab(sheetDestinations: Binding<OverviewsTabSheets?>) -> some View {
        sheet(item: sheetDestinations) { destination in
            let sheetPage = switch destination {
            case .addExpense:
                OverviewDetailsSheet()
            }
            return sheetPage
                .presentationDragIndicator(.visible)
        }
    }
}
