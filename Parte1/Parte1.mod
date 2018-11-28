/*********************************************
 * OPL 12.8.0.0 Model
 * Author: marmanvii
 * Creation Date: Nov 28, 2018 at 2:44:55 PM
 *********************************************/

 range i = 1..5; //5 Categorías, (1 = AC, 2 = CdFM, 3 = BOP, 4 = BG, 5 = CA)

 int Inversion = 1000000;
 float RAE[i] = ...; //Retorno Anual Esperado
 float FR[i] = ...; //Factor de Riesgo
 
 //-------------//
 
 dvar int+ x[i];
 
 maximize sum(i in i)x[i]*RAE[i];
 
 subject to{
 	ct1: x[1] + x[2] <= 0.3*sum(i in i)x[i];
 	ct2: x[4] >= x[5];
 	ct3: x[3] + x[4] <= 0.5*sum(i in i)x[i];
 	ct4: x[4] >= 0.25*sum(i in i)x[i];
 	ct5: sum(i in i)x[i] <= Inversion;
 	
 	ct6: sum(i in i)x[i]*FR[i] <= sum(i in i)x[i]; 
}