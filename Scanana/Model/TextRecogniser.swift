//
//  TextRecogniser.swift
//  Scanana
//
//  Created by Kai Quan Tay on 4/9/24.
//

import Foundation
import Cocoa
import Vision

enum TextRecogniser {
    static func text(from image: NSImage) async -> String? {
        let request = try? await recogniseText(
            in: image.cgImage(
                forProposedRect: nil,
                context: nil,
                hints: nil
            )!
        )

        guard
            let request,
            let observations = request.results as? [VNRecognizedTextObservation]
        else {
            return nil
        }

        let recognizedStrings = observations.compactMap { observation in
            // Return the string of the top VNRecognizedText instance.
            return observation.topCandidates(1).first?.string
        }

        return recognizedStrings.joined(separator: "\n")
    }
}

private func recogniseText(in image: CGImage) async throws -> VNRequest {
    let requestHandler = VNImageRequestHandler(cgImage: image)

    return try await withCheckedThrowingContinuation { cont in
        let request = VNRecognizeTextRequest { req, err in
            if let err {
                cont.resume(throwing: err)
                return
            }
            cont.resume(returning: req)
        }

        do {
            try requestHandler.perform([request])
        } catch {
            cont.resume(throwing: error)
        }
    }
}
