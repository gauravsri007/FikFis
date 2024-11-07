//
//  Overlay.swift
//  FikFis
//
//  Created by apple on 07/11/24.
//

import Foundation
import SwiftUICore

class OverlayManager: ObservableObject {
    @Published var overlayContent: AnyView? = nil
    @Published var shouldDismissOnTap: Bool = true // Default to true for dismiss-on-tap

    // Method to show a specific view with optional dismiss-on-tap functionality
    func show<Content: View>(_ content: Content, dismissOnTap: Bool = true) {
        self.overlayContent = AnyView(content)
        self.shouldDismissOnTap = dismissOnTap
    }
    
    // Method to hide the overlay
    func hide() {
        self.overlayContent = nil
    }
}
