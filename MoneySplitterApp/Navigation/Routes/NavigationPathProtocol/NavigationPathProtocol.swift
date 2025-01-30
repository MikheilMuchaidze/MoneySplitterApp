//
//  NavigationPathProtocol.swift
//  MoneySplitterApp
//
//  Created by Mikheil Muchaidze on 30.01.25.
//

import Foundation

protocol NavigationPathProtocol: Hashable, Identifiable {}

extension NavigationPathProtocol {
    var id: String {
        String(describing: self).components(separatedBy: "(").first ?? String(describing: self)
    }
}

extension NavigationPathProtocol {
    static func == (lhs: any NavigationPathProtocol, rhs: any NavigationPathProtocol) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
