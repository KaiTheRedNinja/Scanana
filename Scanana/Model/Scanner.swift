//
//  Scanner.swift
//  Scanana
//
//  Created by Kai Quan Tay on 4/9/24.
//

import Foundation
import Cocoa

enum Scanner {
    static func scan() async {
        guard
            let image = ScreenCapture.captureRegionImage(),
            let text = await TextRecogniser.text(from: image)
        else {
            return
        }

        let pasteboard = NSPasteboard.general
        pasteboard.declareTypes([.string], owner: nil)
        pasteboard.setString(text, forType: .string)
    }
}
