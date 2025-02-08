//
//  OverviewsTabCoordinator.swift
//  MoneySplitterApp
//
//  Created by Mikheil Muchaidze on 30.01.25.
//

import Foundation

@Observable
final class OverviewsTabCoordinator: CoordinatorProtocol {
    // MARK: - Properties

    var path: [OverviewsTabRoutes] = []
    var presentedSheet: OverviewsTabSheets?
    var dismiss: (() -> ())?

    // MARK: - Init

    nonisolated init() {}

    // MARK: - Functions

    func navigate(to destination: OverviewsTabRoutes) {
        path.append(destination)
    }

    func present(sheet: OverviewsTabSheets) {
        presentedSheet = sheet
    }

    func popToRoot() {
        path = []
    }

    func goBack() {
        guard !path.isEmpty else {
            return
        }
        path.removeLast()
    }

    func removeLastSafely(_ count: Int = 1) {
        if path.count >= count { path.removeLast(count) }
    }

    func dismissSheet() {
        presentedSheet = nil
    }
}
