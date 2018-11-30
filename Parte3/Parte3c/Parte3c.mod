/*********************************************
 * OPL 12.8.0.0 Model
 * Author: claud
 * Creation Date: 30-11-2018 at 1:27:51
 *********************************************/
range i = 1..10; // Áreas del 1 al 10
range j = 1..7; // Sitios del 1 al 7

int Costo[i][j] =...;
int CostoxOP[j] = ...;
int CostoFijo[j] = ...;
int MxArea[i] = ...;

dvar int+ x[i][j]; // Cantidad Enviada de Área i a Sitio j
dvar boolean y[j]; // Utilizar Sitio j

minimize sum(j in j)y[j]*CostoFijo[j] + 
		 sum(j in j)sum(i in i)Costo[i][j]*x[i][j] +
		 sum(j in j)sum(i in i)CostoxOP[j]*x[i][j];
		 
subject to{
	ct1: forall (j in j) sum(i in i)x[i][j] <= y[j]*sum(i in i)MxArea[i];
	ct2: forall (i in i) sum(j in j)x[i][j] == MxArea[i];
}