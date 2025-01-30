//
//  OverviewsTabRoutes.swift
//  MoneySplitterApp
//
//  Created by Mikheil Muchaidze on 30.01.25.
//

import Foundation

enum OverviewsTabRoutes: NavigationPathProtocol {
    case overviewDetails

    var id: String {
        switch self {
        case .overviewDetails:
            "overviewDetails"
        }
    }
}
