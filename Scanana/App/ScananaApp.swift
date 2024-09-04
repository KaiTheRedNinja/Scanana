//
//  ScananaApp.swift
//  Scanana
//
//  Created by Kai Quan Tay on 4/9/24.
//

import SwiftUI

@main
struct ScananaApp: App {
    var body: some Scene {
        // this one is opened when the app is opened. It closes itself if permissions are already granted.
        WindowGroup(id: "main") {
            SettingsView(closeIfPermissionGranted: true)
        }

        // this one is opened when the user requests it
        WindowGroup(id: "settings") {
            SettingsView(closeIfPermissionGranted: false)
        }

        MenuBarExtra {
            ContentView()
        } label: {
            Text("🍌")
        }
    }
}
