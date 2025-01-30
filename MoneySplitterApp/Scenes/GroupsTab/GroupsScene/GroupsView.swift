//
//  GroupsView.swift
//  MoneySplitterApp
//
//  Created by Mikheil Muchaidze on 30.01.25.
//

import SwiftUI

struct GroupsView: View {
    @Binding var coordinator: GroupsTabCoordinator

    var body: some View {
        List {
            Button("Go to Detail") {
                coordinator.navigate(to: .groupsDetails)
            }
        }
        .navigationTitle("GroupsView")
    }
}
