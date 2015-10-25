// Elements Of Programming Interviews
// Chapter 5, Problem 10

// Write a function which takes an integer K and returns the integer 
// corresponding to the digits of K written in reverse order.

#include <cmath>
#include <iostream>
#include <vector>

// We could do many different strategies here
// One would be to convert to a string and reverse the string
// I am going to do something a bit different and reverse a vector
	
// Reverse a 32-bit integer
// Output may be greater than a 32-bit integer can hold
// To prevent problems use a 64-bit value to hold the output
int64_t ReverseInteger (const int32_t input)
{
	int32_t temp = input;
	int64_t output = 0;
	std::vector<int> digits;
	
	bool negativeFlag = false;
	
	// If a number is negative then make it positive
	// We will flip it back the right way at the end
	if (temp < 0)
	{
		negativeFlag = true;
		temp = std::abs (temp);	
	}
	
	// Capture the integer digits and reverse them
	while (temp > 0)
	{
		digits.push_back (temp % 10);
		temp /= 10;
	}

	std::reverse (digits.begin(), digits.end());
	
	// Build up the output integer
	for (int i = 0; i < digits.size(); i++)
	{
		output += digits[i] * std::pow(10, i);
	}
	
	// If we flipped a negative value earlier then make things right
	if (negativeFlag)
		output *= -1;
	
	return output;
}

int main (int argc, char *argv[]) 
{
	// Run some basic tests to check functionality
	bool passedTests = true;
	
	if (0 != ReverseInteger(0))
		passedTests = false;
		
	if (1 != ReverseInteger(1))
		passedTests = false;
		
	if (-1 != ReverseInteger(-1))
		passedTests = false;
		
	if (1 != ReverseInteger(10))
		passedTests = false;
	
	if (-1 != ReverseInteger(-10))
		passedTests = false;
		
	if (1 != ReverseInteger(100))
		passedTests = false;
	
	if (-1 != ReverseInteger(-100))
		passedTests = false;
		
	if (8005 != ReverseInteger(5008))
		passedTests = false;
		
	if (-8005 != ReverseInteger(-5008))
		passedTests = false;
		
	if (7463847412 != ReverseInteger(2147483647))
		passedTests = false;
		
	if (-7463847412 != ReverseInteger(-2147483647))
		passedTests = false;

	std::cout << "Test status: " << passedTests << std::endl;
}