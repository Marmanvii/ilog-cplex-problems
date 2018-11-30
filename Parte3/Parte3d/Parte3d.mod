/*********************************************
 * OPL 12.8.0.0 Model
 * Author: claud
 * Creation Date: 30-11-2018 at 1:28:17
 *********************************************/
range i = 1..10; // Áreas del 1 al 10
range j = 1..7; // Sitios del 1 al 7

int Costo[i][j] =...;
int CostoxOP[j] = ...;
int CostoFijo[j] = ...;
int MxArea[i] = ...;

dvar boolean y[j]; // Utilizar Sitio j

minimize sum(j in j)y[j]*CostoFijo[j] + 
		 sum(i in i)MxArea[i]*sum(j in j)Costo[i][j]*y[j] +
		 sum(i in i)MxArea[i]*sum(j in j)CostoxOP[j]*y[j];
		 
subject to{
	ct1: sum(j in j)y[j] == 1;
}