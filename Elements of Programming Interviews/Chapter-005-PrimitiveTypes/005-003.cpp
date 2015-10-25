// Elements Of Programming Interviews
// Chapter 5, Problem 3

// Write a function that takes a 64-bit word x and returns 
// a 64-bit word consisting of the bits of x in reverse order.

#include <cmath>
#include <iostream>

uint64_t ReverseBits (const uint64_t input)
{
	uint64_t output = 0;
	
	for (int i = 0; i < 64; i++)
		output |= ( ((input >> i) & 1) << (63-i));
	
	return output;	
}

void DisplayBits (const uint64_t input)
{
	for (int i = 0; i < 64; i++)
		std::cout << ((input >> (63-i)) & 1);	
	
	std::cout << std::endl;
}

int main (int argc, char *argv[]) 
{
	bool passedTests = true;
	
	// Test every possible bit state individually
	for (int i = 0; i < 64; i++)
	{
		uint64_t initialValue = std::pow (2, i);
		uint64_t trueValue = std::pow (2, (63-i));
		uint64_t testValue = ReverseBits (initialValue);

		std::cout << initialValue << " - " << trueValue << " - " << testValue << std::endl;
		
		if (testValue != trueValue)
			passedTests = false;
	}
	
	std::cout << "Test status: " << passedTests << std::endl;
}