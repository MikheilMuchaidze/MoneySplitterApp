//
//  HapticFeedbackManagerEnvironmentKey.swift
//  MoneySplitterApp
//
//  Created by Mikheil Muchaidze on 31.01.25.
//

import SwiftUI

private struct HapticFeedbackManagerEnvironmentKey: EnvironmentKey {
    static let defaultValue: HapticFeedbackManager = DefaultHapticFeedbackManager()
}

extension EnvironmentValues {
    var hapticFeedbackManager: HapticFeedbackManager {
        get { self[HapticFeedbackManagerEnvironmentKey.self] }
        set { self[HapticFeedbackManagerEnvironmentKey.self] = newValue }
    }
}

