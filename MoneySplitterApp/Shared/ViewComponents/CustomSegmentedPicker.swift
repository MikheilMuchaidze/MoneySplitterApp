//
//  CustomSegmentedPicker.swift
//  MoneySplitterApp
//
//  Created by Misha Muchaidze on 09.02.25.
//

import SwiftUI

struct CustomSegmentedPicker: View {
    //MARK: - Binding Properties
    
    @Binding private var selectedIndex: Int
    
    //MARK: - Private Properties
    
    private let segments: [String]
    private let textColor: Color
    private let selectedSegmentBackgroundColor: Color
    private let unselectedSegmentBackgroundColor: Color
    private let onSegmentChange: () -> Void
    @Namespace private var animationNamespace
    
    //MARK: - Init
    
    init(
        selectedIndex: Binding<Int>,
        segments: [String],
        textColor: Color,
        selectedSegmentBackgroundColor: Color,
        unselectedSegmentBackgroundColor: Color,
        onSegmentChange: @escaping () -> Void
    ) {
        self._selectedIndex = selectedIndex
        self.segments = segments
        self.textColor = textColor
        self.selectedSegmentBackgroundColor = selectedSegmentBackgroundColor
        self.unselectedSegmentBackgroundColor = unselectedSegmentBackgroundColor
        self.onSegmentChange = onSegmentChange
    }
    
    //MARK: - Body

    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<segments.count, id: \.self) { index in
                Button(action: {
                    withAnimation(.spring(response: 0.2, dampingFraction: 0.7)) {
                        selectedIndex = index
                    }
                    Task { @MainActor in
                        try await Task.sleep(nanoseconds: UInt64(0.2))
                        onSegmentChange()
                    }
                }) {
                    Text(segments[index])
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(textColor)
                        .frame(maxWidth: .infinity, minHeight: 44)
                        .background(
                            ZStack {
                                if selectedIndex == index {
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(selectedSegmentBackgroundColor)
                                        .matchedGeometryEffect(id: "segment", in: animationNamespace)
                                }
                            }
                        )
                        .cornerRadius(8)
                        .padding(2)
                }
            }
        }
        .background(unselectedSegmentBackgroundColor)
        .cornerRadius(10)
        .padding()
    }
}

#Preview {
    @Previewable @State var selectedIndex = 0
    
    CustomSegmentedPicker(
        selectedIndex: $selectedIndex,
        segments: ["Light", "Dark", "System"],
        textColor: .white,
        selectedSegmentBackgroundColor: .purple,
        unselectedSegmentBackgroundColor: .black
    ) {
        print("🟢🟢🟢🟢🟢")
    }
}
