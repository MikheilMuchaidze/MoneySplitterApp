//
//  OverviewView.swift
//  MoneySplitterApp
//
//  Created by Mikheil Muchaidze on 26.01.25.
//

import SwiftUI

struct OverviewView: View {
    @Environment(\.overviewTabCoordinator) private var coordinator
    @State private var favoriteColor = 0

    var body: some View {
        Picker("Theme?", selection: $favoriteColor) {
            Text("Light")
                .tag(3)
            Text("Dark")
                .tag(1)
            Text("System")
                .tag(2)
        }
        .pickerStyle(.segmented)

        List {
            Button("Go to Detail") {
                coordinator.navigate(to: .overviewDetails)
            }
            Button("Go to Detail") {
                coordinator.present(sheet: .addExpense)
            }
        }
        .navigationTitle("OverviewView123")
        .transition(.scale)
    }
}

struct OverviewDetails: View {
    let id: UUID = UUID()

    var body: some View {
        Text("Home Detail View: \(id.uuidString)")
    }
}

struct OverviewDetailsSheet: View {
    let id: UUID = UUID()

    var body: some View {
        Text("Home Detail Sheet: \(id.uuidString)")
            .presentationDetents([.medium])
    }
}

#Preview {
    OverviewView()
}
