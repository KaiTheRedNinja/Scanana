//
//  ScreenCapture.swift
//  Scanana
//
//  Created by Kai Quan Tay on 4/9/24.
//

import Foundation
import Cocoa

enum ScreenCapture {
    public static func captureRegionImage() -> NSImage? {
        let tempDirectory = NSTemporaryDirectory()
        let uuid = UUID().uuidString
        let destination = URL(fileURLWithPath: tempDirectory).appendingPathComponent("screencapture-\(uuid).png")
        let capture = captureRegion(destination)
        return NSImage(contentsOf: capture)
    }

    public static func captureRegion(_ destination: URL) -> URL {
        let destinationPath = destination.path as String

        let task = Process()
        task.launchPath = "/usr/sbin/screencapture"
        task.arguments = ["-i", "-r", destinationPath]
        task.launch()
        task.waitUntilExit()

        return destination
    }
}
