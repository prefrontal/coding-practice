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

typealias Region = Position -> Bool

func Circle (radius:Distance) -> Region
{
    return {point in sqrt(point.x * point.x + point.y*point.y) <= radius}
}