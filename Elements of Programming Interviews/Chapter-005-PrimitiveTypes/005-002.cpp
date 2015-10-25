// Elements Of Programming Interviews
// Chapter 5, Problem 2

// Implement code that takes as input a 64-bit integer and swaps
// the bits in that integer at indices i and j

#include <cmath>
#include <iostream>

uint64_t SwapBits (const uint64_t input, const int i, const int j)
{
	uint64_t output = input;
	
	if (((input >> i) & 1L) != ((input >> j) & 1L))
	{
		output ^= (1L << i);
		output ^= (1L << j);	
	}
	
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
		uint64_t initialValue = 1;
		uint64_t trueValue = std::pow (2, i);
		uint64_t testValue = SwapBits (initialValue, 0, i);

		std::cout << initialValue << " - " << trueValue << " - " << testValue << std::endl;
		
		if (testValue != trueValue)
			passedTests = false;
	}
	
	std::cout << "Test status: " << passedTests << std::endl;
}