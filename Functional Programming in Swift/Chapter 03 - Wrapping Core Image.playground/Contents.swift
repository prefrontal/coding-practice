// Functional Programming in Swift - Chapter 3

/* Wrapping Core Image */

import Foundation
import CoreImage
import AppKit

typealias Filter = CIImage -> CIImage

func blur (radius:Double) -> Filter
{
    return {
        image in
        let parameters = [kCIInputRadiusKey:radius, kCIInputImageKey:image]
        let filter = CIFilter (name:"CIGaussianBlur", withInputParameters:parameters)
        return filter!.outputImage!
    }
}

func colorGenerator (color:NSColor) -> Filter
{
    return { _ in
        let parameters = [kCIInputColorKey: color]
        let filter = CIFilter (name:"CIConstantColorGenerator", withInputParameters:parameters)
        return filter!.outputImage!
    }
}

func compositeSourceOver (overlay:CIImage) -> Filter
{
    return { image in
        let parameters = [kCIInputBackgroundImageKey:image, kCIInputImageKey:overlay]
        let filter = CIFilter (name:"CISourceOverCompositing", withInputParameters: parameters)
        let cropRect = image.extent
        return filter!.outputImage!.imageByCroppingToRect(cropRect)
    }
}

func colorOverlay (color:NSColor) -> Filter
{
    return { image in
        let overlay = colorGenerator(color)(image)
        return compositeSourceOver(overlay)(image)
    }
}

