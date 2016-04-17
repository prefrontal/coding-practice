//: Playground - noun: a place where people can play

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

class Square: Shape
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
        path.moveToPoint(NSPoint(x:left, y:top))
        path.lineToPoint(NSPoint(x:width, y:top))
        path.lineToPoint(NSPoint(x:width, y:width))
        path.lineToPoint(NSPoint(x:left, y:width))
        path.lineToPoint(NSPoint(x:left, y:top))
        return path
    }

    func area () -> Double
    {
        return self.width * self.width
    }

}

class Circle: Shape
{
    var radius:Double = 0

    init (left:Double, top:Double, width:Double)
    {
        super.init (left:left, top:top)
        self.radius = 0.5 * width
    }

    func draw () -> NSBezierPath
    {
        let path = NSBezierPath()
        path.moveToPoint(NSPoint(x:0, y:0))
        path.lineToPoint(NSPoint(x:1000, y:0))
        path.lineToPoint(NSPoint(x:1000, y:1000))
        path.lineToPoint(NSPoint(x:0, y:1000))
        path.lineToPoint(NSPoint(x:0, y:0))
        return path
    }

    func area () -> Double
    {
        return 3.14159 * self.radius * self.radius
    }

    func OffsetFromClosestPointToOrigin () -> Double
    {
        let offset:Double = self.radius - sqrt(0.5 * self.radius * self.radius)
        return offset
    }
}

class MyView: NSView
{
    override func drawRect (dirtyRect:NSRect)
    {
        var left:Double = 0
        var top:Double = 0
        var width:Double = 1000
        var area:Double = 0

        repeat
        {
            // Draw the objects
            let theSquare:Square = Square(left:left, top:top, width:width)
            theSquare.draw().stroke()

            let theCircle:Circle = Circle(left:left, top:top, width:width)
            theCircle.draw().stroke()

            // Determine properties of next iteration
            let offset:Double = theCircle.OffsetFromClosestPointToOrigin()
            left += offset
            top += offset
            width = width - 2*offset

            area = theCircle.area()
        }
        while (area > 1)

        let a:Square = Square(left:0, top:0, width:1000)
        let b:NSBezierPath = a.draw()
        b.stroke()
    }
}

var view = MyView (frame:NSRect(x:0, y:0, width:1100, height:1100))
