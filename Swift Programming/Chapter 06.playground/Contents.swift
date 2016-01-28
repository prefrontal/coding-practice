// Swift Programming Chapter 6

/* Loops */

// The for-in loop operates on a range, sequence, or collection:

var externalCounter:Int = 0

for i in 1...5
{
    externalCounter++
}

// Anonymous iterator:

for _ in 1...5
{
    externalCounter++
}

// Switch cases can be used in a for statement:

for case let i in 1...100 where i % 3 == 0
{
    print(i)
}

// Use for-case statements to improve readability
// Traditional while loop:

var i = 1
while i < 6
{
    externalCounter++
    i++
}

// Use while loops where the total number of iterations is not known
// There is also repeat-while, which is the same as do-while in C:

repeat
{
    externalCounter++
    i++
}
while (i < 20)

// The continue statement is used to skip iterations



