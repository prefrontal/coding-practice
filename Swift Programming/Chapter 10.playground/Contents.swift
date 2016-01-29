// Swift Programming Chapter 10

/* Dictionaries */

// A dictionary holds key-value pairs
// The keys of a dictionary must be unique and they must be hashable

var dict1:Dictionary<String,Double> = [:]
var dict2 = Dictionary<String,Double>()
var dict3:[String:Double] = [:]
var dict4 = [String:Double]()

// The [:] statement is literal syntax, while () uses the default initializer
// Literal initialization:

var movieRatings = ["Donnie Darko":4, "Chungking Express":5, "Dark City":4]

// Dictionary entry count:

print (movieRatings.count)

// Getting a dictionary value using a key:

print (movieRatings["Dark City"])

// The result of a key-value lookup is an optional, in case there is no value for that key
// Modifying a value:

movieRatings["Dark City"] = 5

// The updateValue call returns the previous value for the key:

let oldRating = movieRatings.updateValue(6, forKey: "Dark City")
print (oldRating)

// Add a new key-value pair to the dictionary:

movieRatings["My New Key"] = 7

// Remove a key-value pair:

movieRatings.removeValueForKey("Dark City")

// The removeValueForKey call returns the removed value
// You can also remove a key-value pair by setting it to nil:

movieRatings["My New Key"] = nil

// Iterating over a dictionary:

for (key,value) in movieRatings
{
    print ("\(key) - \(value)")
}

// Just iterating over keys:

for movie in movieRatings.keys
{
    print (movie)
}

// Creating an array from dictionary keys

let watchedMovies = Array(movieRatings.keys)

