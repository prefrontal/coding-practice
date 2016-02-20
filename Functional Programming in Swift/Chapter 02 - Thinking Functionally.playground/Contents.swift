// Functional Programming in Swift - Chapter 2

/* Thinking Functionally */

import Foundation

typealias Position = CGPoint
typealias Distance = CGFloat

// Determine if a target is within range
func inRange1 (target:Position, range:Distance) -> Bool
{
    return sqrt(target.x * target.x + target.y * target.y) <= range
}

// Add the ability to put the center of the range at an offset position
func inRange2 (target:Position, ownPosition:Position, range:Distance) -> Bool
{
    let dx = ownPosition.x - target.x
    let dy = ownPosition.y - target.y
    let targetDistance = sqrt(dx*dx + dy*dy)
    return targetDistance <= range
}

// Add a minimum distance constraint
let minimumDistance:Distance = 2.0

func inRange3 (target:Position, ownPosition:Position, range:Distance) -> Bool
{
    let dX = ownPosition.x - target.x
    let dY = ownPosition.y - target.y
    let targetDistance = sqrt(dX*dX + dY*dY)
    return targetDistance <= range && targetDistance > minimumDistance
}

// Add a minimum distance from friendly ships as well

func inRange4 (target:Position, ownPosition:Position, friendly:Position, range:Distance) -> Bool
{
    let dX = ownPosition.x - target.x
    let dY = ownPosition.y - target.y
    let targetDistance = sqrt(dX*dX + dY*dY)

    let friendlyDx = friendly.x - target.x
    let friendlyDy = friendly.y - target.y
    let friendlyDistance = sqrt(friendlyDx*friendlyDx + friendlyDy*friendlyDy)

    return targetDistance <= range && targetDistance > minimumDistance && friendlyDistance > minimumDistance
}

// As this code grows in complexity it becomes harder and harder to maintain. Time to break it up...
// The key philosophy underlying functional programming is that functions are values

// A region is a function that determines if a given point is in the region or not
typealias Region = Position -> Bool

func Circle (radius:Distance) -> Region
{
    return {point in sqrt(point.x * point.x + point.y*point.y) <= radius}
}

// You can also modify this to put the circle at an arbitary position
func Circle2 (radius:Distance, center:Position) -> Region
{
    return {
        point in
        let shiftedPoint = Position (x:point.x - center.x, y:point.y - center.y)
        return sqrt(shiftedPoint.x * shiftedPoint.x + shiftedPoint.y*shiftedPoint.y) <= radius
    }
}

// The above isn't very functional. You could/should write a value transformer.
func shift (offset:Position, _ region:Region) -> Region
{
    return {
        point in
        let shiftedPoint = Position (x:point.x - offset.x, y:point.y - offset.y)
        return region (shiftedPoint)

    }
}

shift (Position(x:5, y:5), Circle(10))

// You could make an inverter
func invert (region:Region) -> Region
{
    return {point in !region(point)}
}

// Or ways to combine regions
func intersection (region1: Region, _ region2:Region) -> Region
{
    return {point in region1(point) && region2(point)}
}

func union (region1: Region, _ region2:Region) -> Region
{
    return {point in region1(point) || region2(point)}
}

func difference (region: Region, _ minusRegion:Region) -> Region
{
    return intersection (region, invert(minusRegion))
}

// Using these small functions, we can refactor the original implementation of inRange
func inRange (ownPosition:Position, target:Position, friendly:Position, range:Distance) -> Bool
{
    let rangeRegion = difference (Circle(range), Circle(minimumDistance))
    let targetRegion = shift (ownPosition, rangeRegion)
    let friendlyRegion = shift (friendly, Circle(minimumDistance))
    let resultRegion = difference (targetRegion, friendlyRegion)
    return resultRegion (target)
}