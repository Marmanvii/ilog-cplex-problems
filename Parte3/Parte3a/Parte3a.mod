/*********************************************
 * OPL 12.8.0.0 Model
 * Author: claud
 * Creation Date: 30-11-2018 at 1:26:28
 *********************************************/
range i = 1..10; // Áreas del 1 al 10
range j = 1..7; // Sitios del 1 al 7

int Costo[i][j] =...;
int CostoxOP[j] = ...;
int CostoFijo[j] = ...;
int MxArea[i] = ...;

dvar boolean x[j]; // Utilizar Sitio J
dvar boolean y[i][j]; // Área i atendida por el Sitio j

minimize sum(j in j)x[j]*CostoFijo[j] + 
		 sum(i in i)MxArea[i]*sum(j in j)Costo[i][j]*y[i][j] +
		 sum(j in j)CostoxOP[j]*sum(i in i)MxArea[i]*y[i][j];
		 
subject to{
	ct1: forall (i in i) sum(j in j)y[i][j] == 1;
	ct2: forall (j in j) sum(i in i)y[i][j] <= 10*x[j];
}		  
 