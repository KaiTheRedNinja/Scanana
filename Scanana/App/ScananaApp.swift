//
//  ScananaApp.swift
//  Scanana
//
//  Created by Kai Quan Tay on 4/9/24.
//

import SwiftUI
import KeyboardShortcuts

@main
struct ScananaApp: App {
    var body: some Scene {
        // this one is opened when the app is opened. It closes itself if permissions are already granted.
        WindowGroup(id: "main") {
            SettingsView(closeIfPermissionGranted: true)
                .onAppear {
                    KeyboardShortcuts.onKeyUp(for: .capture) {
                        Task {
                            await Scanner.scan()
                        }
                    }
                }
        }
        .windowResizability(.contentSize)

        // this one is opened when the user requests it
        WindowGroup(id: "settings") {
            SettingsView(closeIfPermissionGranted: false)
        }
        .windowResizability(.contentSize)

        MenuBarExtra {
            ContentView()
        } label: {
            Text("🍌")
        }
    }
}

extension KeyboardShortcuts.Name {
    static let capture = Self("capture", default: .init(.c, modifiers: [.command, .option, .control]))
}
