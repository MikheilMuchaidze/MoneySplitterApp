//
//  OverviewsTabCoordinator.swift
//  MoneySplitterApp
//
//  Created by Mikheil Muchaidze on 30.01.25.
//

import Foundation

protocol OverviewsTabCoordinatorProtocol: CoordinatorProtocol where Sheet == OverviewsTabSheets, Route == OverviewsTabRoutes {}

@Observable
final class OverviewsTabCoordinator: OverviewsTabCoordinatorProtocol {
    // MARK: - Properties

    var path: [OverviewsTabRoutes] = []
    var presentedSheet: OverviewsTabSheets?
    var dismiss: (() -> ())?

    // MARK: - Init

    nonisolated init() {}

    // MARK: - Methods

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
