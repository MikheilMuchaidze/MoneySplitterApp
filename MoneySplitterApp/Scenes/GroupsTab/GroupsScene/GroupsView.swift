//
//  GroupsView.swift
//  MoneySplitterApp
//
//  Created by Mikheil Muchaidze on 30.01.25.
//

import SwiftUI

struct GroupsView: View {
    @Environment(\.groupsTabCoordinator) private var coordinator

    var body: some View {
        List {
            Button("Go to Detail") {
                coordinator.navigate(to: .groupsDetails)
            }
        }
        .navigationTitle("GroupsView")
    }
}

struct GroupsViewDetails: View {
    var body: some View {
        Text("GroupsViewDetails")
    }
}
