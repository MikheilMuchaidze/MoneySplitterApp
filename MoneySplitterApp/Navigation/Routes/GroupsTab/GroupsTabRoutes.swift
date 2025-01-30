//
//  GroupsTabRoutes.swift
//  MoneySplitterApp
//
//  Created by Mikheil Muchaidze on 30.01.25.
//

import Foundation

enum GroupsTabRoutes: NavigationPathProtocol {
    case groupsDetails

    var id: String {
        switch self {
        case .groupsDetails:
            "groupsDetails"
        }
    }
}
