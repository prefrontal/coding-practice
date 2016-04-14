

#include <iostream>

class Base
{
	public:
	void myFunc ()
	{
		std::cout << "Base class" << std::endl;	
	}
	
	virtual void myVirtualFunc ()
	{
		std::cout << "Base-Virtual" << std::endl;	
	}
};

class Sub : public Base
{
	public:
	void myFunc ()
	{
		std::cout << "Subclass" << std::endl;	
	}
	
	virtual void myVirtualFunc ()
	{
		std::cout << "Subclass-Virtual" << std::endl;	
	}
};

int main (int argc, char *argv[]) 
{
	std::cout << "--Subclass calls--" << std::endl;
	Sub *s = new Sub;
	std::cout << "Standard: ";
	s->myFunc();
	std::cout << "Virtual: ";
	s->myVirtualFunc();
	
	std::cout << std::endl << "--Base class calls--" << std::endl;
	Base *b = static_cast<Base*>(s);
	std::cout << "Standard: ";
	b->myFunc();
	std::cout << "Virtual: ";
	b->myVirtualFunc();
}