//
//  SettingsView.swift
//  Scanana
//
//  Created by Kai Quan Tay on 4/9/24.
//

import SwiftUI

struct SettingsView: View {
    var closeIfPermissionGranted: Bool = false

    @Environment(\.dismissWindow) var dismiss

    var body: some View {
        List {
        }
        .navigationTitle("Settings")
        .onAppear {
            if closeIfPermissionGranted && CGPreflightScreenCaptureAccess() {
                dismiss.callAsFunction()
            }
        }
    }
}

#Preview {
    SettingsView()
}
