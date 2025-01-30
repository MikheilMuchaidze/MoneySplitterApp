//
//  OverviewsTabSheets.swift
//  MoneySplitterApp
//
//  Created by Mikheil Muchaidze on 30.01.25.
//

import Foundation

enum OverviewsTabSheets: NavigationPathProtocol {
    case addExpense

    var id: String {
        switch self {
        case .addExpense:
            "addExpense"
        }
    }
}
