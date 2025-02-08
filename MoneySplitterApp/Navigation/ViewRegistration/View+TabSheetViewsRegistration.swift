//
//  View+TabSheetViewsRegistration.swift
//  MoneySplitterApp
//
//  Created by Mikheil Muchaidze on 30.01.25.
//

import SwiftUI

@MainActor
extension View {
    func registerSheetViewsFor<T: NavigationPathProtocol>(sheetDestinations: Binding<T?>) -> some View {
        sheet(item: sheetDestinations) { destination in
            let sheetPage: AnyView = switch destination {
            case let overviewSheet as OverviewsTabSheets:
                switch overviewSheet {
                case .addExpense:
                    AnyView(OverviewDetailsSheet())
                }
            case let settingsSheet as SettingsTabSheets:
                AnyView(EmptyView())
            case let groupsSheet as GroupsTabSheets:
                AnyView(EmptyView())
            default:
                AnyView(EmptyView())
            }
            
            return sheetPage
                .presentationDragIndicator(.visible)
        }
    }
}
