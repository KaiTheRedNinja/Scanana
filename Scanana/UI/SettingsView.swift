//
//  SettingsView.swift
//  Scanana
//
//  Created by Kai Quan Tay on 4/9/24.
//

import SwiftUI
import KeyboardShortcuts

struct SettingsView: View {
    var closeIfPermissionGranted: Bool = false

    @Environment(\.dismissWindow) var dismiss

    @State var permissionsGranted: Bool = CGPreflightScreenCaptureAccess()

    var refreshTimer = Timer.publish(every: 3, on: .main, in: .default).autoconnect()

    var body: some View {
        List {
            Section("Permissions") {
                if permissionsGranted {
                    Text("Screen capture permission granted!")
                        .foregroundStyle(.green)
                } else {
                    Text("Please grant Screen Capture permission to Scanana in System Settings")
                        .foregroundStyle(.red)
                }
            }
            .onReceive(refreshTimer) { _ in
                permissionsGranted = CGPreflightScreenCaptureAccess()
            }

            Section("Controls") {
                KeyboardShortcuts.Recorder("Capture text:", name: .capture)
            }

            Section("Credits") {
                Text("Scanana was developed by Kai Quan Tay")
                Text("Scanana's Github")
                    .foregroundStyle(.blue)
                    .underline()
                    .onTapGesture {
                        NSWorkspace.shared.open(URL(string: "https://github.com/KaiTheRedNinja/Scanana")!)
                    }
                Text("Keyboard Shortcuts Library")
                    .foregroundStyle(.blue)
                    .underline()
                    .onTapGesture {
                        NSWorkspace.shared.open(URL(string: "https://github.com/sindresorhus/KeyboardShortcuts")!)
                    }
            }

            Section {
                Button("Quit Scanana", role: .destructive) {
                    NSApplication.shared.terminate(self)
                }
                .buttonStyle(.borderedProminent)
                .tint(.red)
            }
        }
        .navigationTitle("Settings")
        .onAppear {
            if closeIfPermissionGranted && permissionsGranted {
                dismiss.callAsFunction()
            }
        }
        .frame(width: 400, height: 300)
    }
}

#Preview {
    SettingsView()
}
