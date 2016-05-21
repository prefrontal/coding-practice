// CirclesSquares.playground
//
// For a view with a given width, draw squares and circles inscribed in 
// squares until the area of the shapes reaches a predetermined limit

import Cocoa
import XCPlayground

// Base class for all geometric shapes
class Shape
{
    var left:Double = 0
    var top:Double = 0

    init (left:Double, top:Double)
    {
        self.left = left
        self.top = top
    }
}

// Protocol that defines required methods for a drawable shape
protocol Drawable
{
    func draw () -> NSBezierPath
    func area () -> Double
}

class Square: Shape, Drawable
{
    var width:Double = 0

    init (left:Double, top:Double, width:Double)
    {
        super.init (left:left, top:top)
        self.width = width
    }

    func draw () -> NSBezierPath
    {
        let path = NSBezierPath()
        let rect = NSMakeRect (CGFloat(self.left), CGFloat(self.top), CGFloat(self.width), CGFloat(self.width))
        path.appendBezierPathWithRect(rect)
        return path
    }

    func area () -> Double
    {
        return pow(self.width,2)
    }

}

class Circle: Shape, Drawable
{
    var radius:Double = 0

    init (left:Double, top:Double, width:Double)
    {
        super.init (left:left, top:top)
        self.radius = 0.5 * width
    }

    func draw () -> NSBezierPath
    {
        let path = NSBezierPath ()
        let rect = NSMakeRect (CGFloat(self.left), CGFloat(self.top), CGFloat(self.radius*2), CGFloat(self.radius*2))
        path.appendBezierPathWithOvalInRect(rect)
        return path
    }

    func area () -> Double
    {
        return M_PI * self.radius * self.radius
    }

    func OffsetFromClosestPointToOrigin () -> Double
    {
        let offset:Double = self.radius - sqrt(0.5 * pow(self.radius,2))
        return offset
    }
}

// View to draw squares with inscribed circles
class MyView: NSView
{
    override func drawRect (dirtyRect:NSRect)
    {
        // Initial conditions
        var left:Double = 0
        var top:Double = 0
        var width:Double = 500
        var area:Double = 0

        repeat
        {
            // Draw the objects
            NSColor.greenColor().set()
            let theCircle:Circle = Circle(left:left, top:top, width:width)
            theCircle.draw().stroke()

            NSColor.redColor().set()
            let theSquare:Square = Square(left:left, top:top, width:width)
            theSquare.draw().stroke()

            // Determine properties of next iteration
            let offset:Double = theCircle.OffsetFromClosestPointToOrigin()
            left += offset
            top += offset
            width = width - 2*offset

            area = theCircle.area()
        }
        while (area > 1)
    }
}

var view = MyView (frame:NSRect(x:0, y:0, width:500, height:500))
XCPlaygroundPage.currentPage.liveView = view


