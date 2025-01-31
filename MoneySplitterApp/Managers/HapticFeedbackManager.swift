//
//  HapticFeedbackManager.swift
//  MoneySplitterApp
//
//  Created by Mikheil Muchaidze on 31.01.25.
//

import SwiftUI

protocol HapticFeedbackManager {
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle)
    func notification(type: UINotificationFeedbackGenerator.FeedbackType)
    func selection()
}

struct DefaultHapticFeedbackManager: HapticFeedbackManager {
    // MARK: - Feedback Generators

    private let generatorImpact = UIImpactFeedbackGenerator()
    private let generatorNotification = UINotificationFeedbackGenerator()
    private let generatorSelection = UISelectionFeedbackGenerator()

    // MARK: - Public Methods

    /// Generates impact feedback (light, medium, heavy, rigid, soft)
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.prepare()
        generator.impactOccurred()
    }

    /// Generates notification feedback (success, warning, error)
    func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        generatorNotification.prepare()
        generatorNotification.notificationOccurred(type)
    }

    /// Generates selection feedback (used for changing selection states)
    func selection() {
        generatorSelection.prepare()
        generatorSelection.selectionChanged()
    }
}
