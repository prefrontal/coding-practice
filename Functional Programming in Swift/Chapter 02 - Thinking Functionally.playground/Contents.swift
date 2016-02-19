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