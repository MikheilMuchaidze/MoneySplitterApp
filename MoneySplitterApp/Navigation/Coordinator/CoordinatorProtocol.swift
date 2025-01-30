//
//  CoordinatorProtocol.swift
//  MoneySplitterApp
//
//  Created by Mikheil Muchaidze on 26.01.25.
//

import SwiftUI

protocol CoordinatorProtocol {
    associatedtype Route: NavigationPathProtocol
    associatedtype Sheet: NavigationPathProtocol

    var path: [Route] { get set }
    var presentedSheet: (Sheet)? { get set }
    var dismiss: (() -> ())? { get set }

    func navigate(to destination: Route)
    func present(sheet: Sheet)
    func popToRoot()
    func goBack()
    func removeLastSafely(_ count: Int)
    func dismissSheet()
}
