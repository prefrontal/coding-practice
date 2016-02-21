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

// -----

let url = NSURL(string:"http://www.objc.io/images/covers/16.jpg")
let image = CIImage(contentsOfURL:url!)

let blurRadius = 5.0
let overlayColor = NSColor.redColor().colorWithAlphaComponent(0.2)
let blurredImage = blur(blurRadius)(image!)
let overlaidImage = colorOverlay(overlayColor)(blurredImage)

// You can also put everything on one line, but it gets complicated
let result = colorOverlay (overlayColor)(blur(blurRadius)(image!))

// Instead, you can make another function to compose the filters
func composeFilters (filter1:Filter, _ filter2:Filter) -> Filter
{
    return {img in filter2(filter1(img))}
}

let myFilter1 = composeFilters (blur(blurRadius), colorOverlay(overlayColor))
let result1 = myFilter1 (image!)

// You can make it even more straightforward by using an operator
infix operator >>> {associativity left}

func >>> (filter1:Filter, filter2:Filter) -> Filter
{
    return {img in filter2(filter1(img))}
}

let myFilter2 = blur(blurRadius) >>> colorOverlay(overlayColor)
let result2 = myFilter2 (image!)

// ---- Background:Currying --------------------------------------------------------------------------------------------

// Two ways to define a function that takes two parameters:

func add1 (x:Int, _ y:Int) -> Int
{
    return x+y
}

func add2 (x:Int) -> (Int -> Int)
{
    return {y in return x + y}
}

// The second version returns a closure that expects a second argument:

add1 (1, 2)
add2 (1)(2)

// You can even leave out one of the return statements and some parentheses:

func add2a (x:Int) -> Int -> Int
{
    return { y in x + y}
}

// Currying is the process of transforming a function that expects many arguments
// into a series of functions that each expect one argument

// Instead of defining the closre explicitly we cna make a curried version:

func add3 (x:Int)(_ y:Int) -> Int
{
    return x + y
}


