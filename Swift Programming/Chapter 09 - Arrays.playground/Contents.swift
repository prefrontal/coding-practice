// Swift Programming Chapter 9

/* Arrays */

var bucketList:Array<String> = ["Climb Mt. Everest"]
var bucketList2:[String] = ["Climb Mt. Everest"]

// Let type inference help you:

var bucketList3 = ["Climb Mt. Everest"]

// Append an element to array:

bucketList.append("Fly hot air baloon to Fiji")
bucketList.append("Watch LotR trilogy")
bucketList.append("Go on a walkabout")

// Remove an element from array:

bucketList.removeAtIndex(2)

// Counting items in an array:

bucketList.count

// Subscripting, single and a range:

bucketList[0]

bucketList[0...2]

// Replacing an array value:

bucketList[0] = "Climb Mt. Kilimanjaro"

// Insert new value at an index:

bucketList.insert("Toboggan across Alaska", atIndex: 1)

// You can compare arrays with the comparison operator, ==
// Remember that arrays are sorted, and they must be exactly the same


