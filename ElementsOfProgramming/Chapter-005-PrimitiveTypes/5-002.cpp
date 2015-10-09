// Elements Of Programming Interviews
// Chapter 5, Problem 2

// Implement code that takes as input a 64-bit integer and swaps
// the bits in that integer at indices i and j

#include <iostream>

int64_t SwapBits (const int64_t input, const int i, const int j)
{
	int64_t output = input;
	
	if (((input >> i) & 1) != ((input >> j) & 1)
		// Swap bits in output
	
	return output;	
}

int main (int argc, char *argv[]) 
{
	
}