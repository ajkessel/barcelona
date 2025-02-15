//
//  CBTranscoding.swift
//  Barcelona
//
//  Created by Eric Rabil on 6/8/22.
//

import Foundation
import CoreImage

public struct CBTranscoding {
}

public extension CBTranscoding {
    static func toJPEG(contentsOf url: URL) -> Data? {
        let context = CIContext(options: nil)
        let options = [CIImageRepresentationOption.init(rawValue: kCGImageDestinationLossyCompressionQuality as String):1.0]
        guard let image = CIImage(contentsOf: url) else {
            return nil
        }
        return context.jpegRepresentation(of: image, colorSpace: image.colorSpace!, options: options)
    }
}
