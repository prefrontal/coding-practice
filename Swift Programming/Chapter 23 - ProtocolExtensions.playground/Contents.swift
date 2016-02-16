// Swift Programming Chapter 23

/* Protocol Extensions */

import Cocoa

protocol ExerciseType
{
    var name:String {get}
    var caloriesBurned:Double {get}
    var minutes:Double {get}
}

struct EllipticalTraininer:ExerciseType
{
    let name = "Elliptical Machine"
    let caloriesBurned:Double
    let minutes:Double
}

let ellipticalWorkout = EllipticalTraininer (caloriesBurned: 335, minutes: 30)

struct Treadmill:ExerciseType
{
    let name = "Treadmill"
    let caloriesBurned:Double
    let minutes:Double
    let distanceInMiles:Double
}

let runningWorkout = Treadmill (caloriesBurned: 350, minutes: 25, distanceInMiles: 4.2)

// Generic implementation
//    func caloriesBurnedPerMInute<Exercise:ExerciseType> (exercise:Exercise) -> Double
//    {
//        return exercise.caloriesBurned / exercise.minutes
//    }

// Protocol extension!
// Cannot add new requirements to a protocol, but can add new properties and methods
// You can only make use of other properties and methods that are guaranteed to exist
extension ExerciseType
{
    var caloriesBurnedPerMinute:Double
    {
        return caloriesBurned / minutes
    }
}

print (ellipticalWorkout.caloriesBurnedPerMinute)
print (runningWorkout.caloriesBurnedPerMinute)

// Protocol extension where clauses

extension SequenceType where Generator.Element == ExerciseType
{
    func totalCaloriesBurned() -> Double
    {
        var total:Double = 0
        for exercise in self
        {
            total += exercise.caloriesBurned
        }
        return total
    }
}

let mondayWorkout:[ExerciseType] = [ellipticalWorkout, runningWorkout]
print (mondayWorkout.totalCaloriesBurned())

// Default implementations with protocol extensions

protocol ExerciseType2:CustomStringConvertible
{
    var name:String {get}
    var caloriesBurned:Double {get}
    var minutes:Double {get}
}

// Add a default implementation of description to all types that conform to ExerciseType2
extension ExerciseType2
{
    var description:String
    {
        return "Exercise (\(name), burned \(caloriesBurned) calories in \(minutes) minutes)"
    }
}

// Now override the default implementation of description for Treadmill
extension Treadmill
{
    var description:String
    {
        return "Treadmill (\(name), burned \(caloriesBurned) calories and \(distanceInMiles) in \(minutes) minutes)"
    }
}

// Naming things - a cautionary tale

extension ExerciseType
{
    var title:String
    {
        return "\(name) - \(minutes)"
    }
}

for exercise in mondayWorkout
{
    print (exercise.title)
}