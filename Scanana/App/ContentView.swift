//
//  ContentView.swift
//  Scanana
//
//  Created by Kai Quan Tay on 4/9/24.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.openWindow) var openWindow

    var body: some View {
        Button("Capture") {
            Task {
                await Scanner.scan()
            }
        }

        Button("Open Settings") {
            openWindow.callAsFunction(id: "settings")
        }
        .keyboardShortcut(.init(","), modifiers: .command)

        Divider()

        Button("Quit Scanana") {
            NSApplication.shared.terminate(self)
        }
        .keyboardShortcut(.init("q"), modifiers: .command)
    }
}

#Preview {
    Menu {
        ContentView()
    } label: {
        Text("Press me")
    }
}
