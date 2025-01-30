//
//  MainView.swift
//  MoneySplitterApp
//
//  Created by Mikheil Muchaidze on 26.01.25.
//

import SwiftUI

enum BottomTabBarItem: String, CaseIterable {
    case overviews
    case groups
    case settings

    var systemImage: String {
        switch self {
        case .overviews:
            return "house.fill"
        case .groups:
            return "person.3.fill"
        case .settings:
            return "gearshape.fill"
        }
    }

    nonisolated var id: String {
      rawValue
    }
}

struct AnimatedTab: Identifiable {
    var id: UUID = .init()
    var tab: BottomTabBarItem
    var isAnimating: Bool?
}

struct MainView: View {
    // MARK: - Tab Coordinators

    @State var overviewTabCoordinator = OverviewsTabCoordinator()
    @State var groupsTabCoordinator = GroupsTabCoordinator()
    @State var settingsTabCoordinator = SettingsTabCoordinator()

    // MARK: - Tabs

    @State var selectedTab: BottomTabBarItem = .overviews
    @State private var allTabs: [AnimatedTab] = BottomTabBarItem.allCases.compactMap { tab -> AnimatedTab? in
            .init(tab: tab)
    }

    // MARK: - Body

    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $selectedTab) {
                overviewsTab
                groupsTab
                settingsTab
            }
            tabView()
        }
    }

    // MARK: - Overviews Tab

    private var overviewsTab: some View {
        NavigationStack(path: $overviewTabCoordinator.path) {
            OverviewView(coordinator: $overviewTabCoordinator)
                .registerViewsForCoordinatorOnOverviewsTab(overviewTabCoordinator)
                .registerSheetViewsForCoordinatorOnOverviewsTab(sheetDestinations: $overviewTabCoordinator.presentedSheet)
                .toolbar(.hidden, for: .tabBar)
        }
        .tabItem {
            Label(
                BottomTabBarItem.overviews.rawValue,
                systemImage: BottomTabBarItem.overviews.systemImage
            )
        }
        .tag(BottomTabBarItem.overviews)
    }

    // MARK: - Groups Tab

    private var groupsTab: some View {
        NavigationStack(path: $groupsTabCoordinator.path) {
            GroupsView(coordinator: $groupsTabCoordinator)
                .toolbar(.hidden, for: .tabBar)
        }
        .tabItem {
            Label(
                BottomTabBarItem.groups.rawValue,
                systemImage: BottomTabBarItem.groups.systemImage
            )
        }
        .tag(BottomTabBarItem.groups)
    }

    // MARK: - Settings Tab

    private var settingsTab: some View {
        NavigationStack(path: $settingsTabCoordinator.path) {
            SettingsView(coordinator: $settingsTabCoordinator)
                .toolbar(.hidden, for: .tabBar)
        }
        .tabItem {
            Label(
                BottomTabBarItem.settings.rawValue,
                systemImage: BottomTabBarItem.settings.systemImage
            )
        }
        .tag(BottomTabBarItem.settings)
    }

    // MARK: - Custom Tab View

    @MainActor
    func tabView() -> some View {
        HStack(spacing: 0) {
            ForEach($allTabs) { $animatedTab in
                let tab = animatedTab.tab

                VStack(spacing: 6) {
                    Image(systemName: tab.systemImage)
                        .font(.title2)
                        .symbolEffect(.bounce.down.byLayer, value: animatedTab.isAnimating)

                    Text(tab.rawValue.capitalized)
                        .font(.caption)
                        .fontWeight(.medium)
                }
                .frame(maxWidth: .infinity)
                .foregroundStyle(selectedTab == tab ? Color.purple : Color.white.opacity(0.7))
                .padding(.vertical, 15)
                .contentShape(Rectangle())
                .onTapGesture {
                    withAnimation(.bouncy) {
                        selectedTab = tab
                        animatedTab.isAnimating = true
                    }

                    animatedTab.isAnimating = nil
                }
            }
        }
        .padding(.horizontal, 25)
        .background(
            Color.black
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 4)
        )
        .padding(.horizontal, 20)
        .padding(.bottom, 20)
    }
}

#Preview {
    MainView()
}
