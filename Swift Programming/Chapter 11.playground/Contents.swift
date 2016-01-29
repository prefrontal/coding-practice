// Swift Programming Chapter 11

/* Sets */

// A set is an unordered colelcction of distinct instances

var groceryBag = Set<String>()

// Adding to a set:

groceryBag.insert("Apples")
groceryBag.insert("Oranges")
groceryBag.insert("Pineapples")

// Looping through a set:

for food in groceryBag
{
    print (food)
}

// Set from literal array syntax:

var groceryBag2 = Set(["Apples", "Pears", "Lettuce"])

var groceryBag3:Set = ["Apples", "Pears", "Lettuce"]

// Determine if an item is in a set:

let hasBananas = groceryBag.contains("Bananas")

// Unions combine two sets together:

let commonGroceries = groceryBag.union(groceryBag2)

// Intersections let you determine what is shared between sets:

let itemsToReturn = groceryBag.intersect(groceryBag2)

// Disjoint operation tells you if the elements in two sets are unique

let disjointItems = groceryBag.isDisjointWith(groceryBag2)



