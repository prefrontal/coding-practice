// Cracking The Coding Interview
// Chapter 1, Problem 5

#include <iostream>
#include <stdlib.h>

/*
* In-place compression of character array
*/
void Compressor (char theArray[], int arrayLength)
{
    std::cout << std::endl << theArray << std::endl;
    
    // This could only be a character and a null terminator
    if (arrayLength <= 2)
        return; 

    // --------------------------------
    
    char lastCharacterMatched = '\0';
    int lastPosition = 0;
    int repetitionCount = 1;
    
    for (int i = 0; i < arrayLength; i++)
    {
        if (theArray[i] == lastCharacterMatched)
        {
            // We found a duplicate character
            repetitionCount++;
        }
        else if (1 == repetitionCount)
        {
            // Was just a single character
            lastCharacterMatched = theArray[i];
            theArray[lastPosition++] = theArray[i];
            repetitionCount = 1;
        }
        else if (1 < repetitionCount)
        {
            // We had mutlitple characters, time to compress
            char buffer[30];
            sprintf (buffer, "%d", repetitionCount);
            int bufLength = strlen(buffer);
            
            for (int j = 0; j < bufLength; j++)
                theArray[lastPosition++] = buffer[j];
            
            lastCharacterMatched = theArray[i];
            theArray[lastPosition++] = theArray[i];
            repetitionCount = 1;
        }
        
        if ((theArray[i] == '\0') and (0 < repetitionCount))
        {
            theArray[lastPosition++] = static_cast<char>(repetitionCount + 48); 
        }
    }

    std::cout << theArray << std::endl;
}

int main(int argc, char *argv[]) 
{
    char test1[] = "AAABBBCCCC";
    int length1 = 11;
    Compressor (test1, length1);
    
    char test2[] = "AAAAAAA";
    int length2 = 8;
    Compressor (test2, length2);
    
    char test3[] = "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB";
    int length3 = 92;
    Compressor (test3, length3);  
    
    char test4[] = "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~";
    int length4 = 102;
    Compressor (test4, length4);
    
    char test5[] = "ABCDEF";
    int length5 = 7;
    Compressor (test5, length5);
    
    char test6[] = "AAAABCCCCD";
    int length6 = 11;
    Compressor (test6, length6);
   
    // -----------------------------
    
    char test100[] = "";
    int length100 = 1;
    Compressor (test100, length100);
    
    char test101[] = "A";
    int length101 = 2;
    Compressor (test101, length101);
    
    char test102[] = "AA";
    int length102 = 3;
    Compressor (test102, length102);
}