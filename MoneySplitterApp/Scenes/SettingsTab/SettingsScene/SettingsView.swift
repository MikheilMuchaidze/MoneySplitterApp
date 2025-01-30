//
//  SettingsView.swift
//  MoneySplitterApp
//
//  Created by Mikheil Muchaidze on 30.01.25.
//

import SwiftUI

struct SettingsView: View {
    @Binding var coordinator: SettingsTabCoordinator

    var body: some View {
        HStack {
            Spacer()
            Text("SettingsView")
                .font(.headline)
            Spacer()
        }
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(8)
    }
}
