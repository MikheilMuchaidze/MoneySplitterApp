//
//  GroupsTabCoordinator.swift
//  MoneySplitterApp
//
//  Created by Mikheil Muchaidze on 30.01.25.
//

import Foundation

@Observable
final class GroupsTabCoordinator: CoordinatorProtocol {
    // MARK: - Properties

    var path: [GroupsTabRoutes] = []
    var presentedSheet: GroupsTabSheets?
    var dismiss: (() -> ())?

    // MARK: - Init

    nonisolated init() {}

    // MARK: - Functions

    func navigate(to destination: GroupsTabRoutes) {
        path.append(destination)
    }

    func present(sheet: GroupsTabSheets) {
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
