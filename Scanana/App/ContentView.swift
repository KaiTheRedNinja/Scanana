//
//  ContentView.swift
//  Scanana
//
//  Created by Kai Quan Tay on 4/9/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button("Capture") {
        }

        Button("Quit") {
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
