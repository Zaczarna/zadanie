// Justyna Olczak & Magdalena Oćwieja
#include <iostream>
#include "Dodaj.h"


using namespace std;
int main()
{
	hello();
	cout << endl;
	cout << suma(3,5);
	cout << endl;

	Cook cook;
	PizzaBuilder* hawaiianPizzaBuilder = new HawaiianPizzaBuilder;
	PizzaBuilder* spicyPizzaBuilder   = new SpicyPizzaBuilder;
 
	cook.setPizzaBuilder(hawaiianPizzaBuilder);
	cook.constructPizza();
 
	Pizza* hawaiian = cook.getPizza();
	hawaiian->open();
 
	cook.setPizzaBuilder(spicyPizzaBuilder);
	cook.constructPizza();
 
	Pizza* spicy = cook.getPizza();
	spicy->open();
 
	delete hawaiianPizzaBuilder;
	delete spicyPizzaBuilder;
	delete hawaiian;  
	delete spicy; 

}
