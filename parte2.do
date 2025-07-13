cd "C:\eco-poli\TRABAJO FINAL\CÓDIGO EN R\NUEVO MODELO\STATA"

use merged_data


import excel using merged_data ,clear
describe
list in 1/10
browse

* Paso 1: Convertir todas las variables a numéricas excepto 'country' y 'year'
foreach var of varlist _all {
    * Verificar si la variable no es 'country' ni 'year'
    if "`var'" != "country" & "`var'" != "Year" {
        * Convertir la variable de cadena a numérica
        destring `var', replace
    }
}

* Paso 2: Verificar que las conversiones se hayan realizado correctamente
describe

browse


gen k_per_capita = capital/LaborForce
rename k_per_capita k

browse


save merged_data.dta, replace


use merged_data
browse









* 
* Definir los datos como panel
xtset country Year


