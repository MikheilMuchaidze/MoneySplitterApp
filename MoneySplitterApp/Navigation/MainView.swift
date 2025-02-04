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

    var image: String {
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

    @State private var selectedTab: BottomTabBarItem = .overviews
    @State private var allTabs: [AnimatedTab] = BottomTabBarItem.allCases.compactMap { tab -> AnimatedTab? in
            .init(tab: tab)
    }

    // MARK: - Themes

    @Environment(\.themeManager) private var themeManager
    @Environment(\.colorScheme) private var colorScheme

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
        .environment(\.overviewTabCoordinator, overviewTabCoordinator)
        .environment(\.groupsTabCoordinator, groupsTabCoordinator)
        .environment(\.settingsTabCoordinator, settingsTabCoordinator)
        .environment(\.hapticFeedbackManager, DefaultHapticFeedbackManager())
        .environment(\.themeManager, themeManager)
        .onChange(of: colorScheme) { _, newValue in
            if themeManager.selectedTheme == .system {
                newValue == .dark
                    ? themeManager.changeTheme(to: .dark)
                    : themeManager.changeTheme(to: .light)
            }
        }
    }

    // MARK: - Overviews Tab

    private var overviewsTab: some View {
        NavigationStack(path: $overviewTabCoordinator.path) {
            OverviewView()
                .registerViewsForCoordinatorOnOverviewsTab(overviewTabCoordinator)
                .registerSheetViewsForCoordinatorOnOverviewsTab(sheetDestinations: $overviewTabCoordinator.presentedSheet)
                .toolbar(.hidden, for: .tabBar)
        }
        .tag(BottomTabBarItem.overviews)
    }

    // MARK: - Groups Tab

    private var groupsTab: some View {
        NavigationStack(path: $groupsTabCoordinator.path) {
            GroupsView()
                .toolbar(.hidden, for: .tabBar)
        }
        .tag(BottomTabBarItem.groups)
    }

    // MARK: - Settings Tab

    private var settingsTab: some View {
        NavigationStack(path: $settingsTabCoordinator.path) {
            SettingsView()
                .toolbar(.hidden, for: .tabBar)
        }
        .tag(BottomTabBarItem.settings)
    }

    // MARK: - Custom Tab View

    @MainActor
    func tabView() -> some View {
        HStack(spacing: 0) {
            ForEach($allTabs) { $animatedTab in
                let tab = animatedTab.tab

                VStack {
                    Image(systemName: tab.image)
                        .resizable()
                        .symbolEffect(
                            .bounce.down.byLayer,
                            value: animatedTab.isAnimating
                        )
                        .scaledToFit()
                    Spacer()
                    Text(tab.rawValue)
                }
                .padding(.horizontal, 20)
                .foregroundStyle(
                    selectedTab == tab
                    ? themeManager.activeTheme.primarySelectedColor
                    : themeManager.activeTheme.primaryDeselectedColor
                )
                .onTapGesture {
                    withAnimation(.bouncy(duration: 0.1)) {
                        DefaultHapticFeedbackManager().impact(style: .soft)
                        selectedTab = tab
                        animatedTab.isAnimating = true
                    }
                    animatedTab.isAnimating = nil
                }
            }
        }
        .frame(
            maxWidth: .infinity,
            minHeight: 50,
            maxHeight: 50
        )
        .padding(.vertical, 10)
        .background(
            themeManager.activeTheme.tabViewColor
                .clipShape(RoundedRectangle(cornerRadius: 30))
        )
        .padding(.horizontal, 40)
        .background(.gray.opacity(0.4))
    }
}

#Preview {
    MainView()
        .environment(\.themeManager, ThemeManager())
}
