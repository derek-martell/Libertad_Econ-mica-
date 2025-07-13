cd "C:\eco-poli\TRABAJO FINAL\CÓDIGO EN R\NUEVO MODELO\STATA"
* Paso 1: Ver las hojas disponibles en el archivo Excel
import excel using "C:\eco-poli\TRABAJO FINAL\CÓDIGO EN R\NUEVO MODELO\STATA\dataframes.xlsx", describe

* Paso 2: Importar y ver la primera hoja (df)
import excel using "C:\eco-poli\TRABAJO FINAL\CÓDIGO EN R\NUEVO MODELO\STATA\dataframes.xlsx", sheet("df") clear
describe
list in 1/10

* Paso 3: Guardar la primera hoja en un archivo Stata
save df.dta, replace

* Paso 4: Importar y ver la segunda hoja (df2)
import excel using "C:\eco-poli\TRABAJO FINAL\CÓDIGO EN R\NUEVO MODELO\STATA\dataframes.xlsx", sheet("df2") clear
describe
list in 1/10

* Paso 5: Guardar la segunda hoja en un archivo Stata
save df2.dta, replace

* Paso 6: Importar y ver la tercera hoja (df3)
import excel using "C:\eco-poli\TRABAJO FINAL\CÓDIGO EN R\NUEVO MODELO\STATA\dataframes.xlsx", sheet("df3") clear
describe
list in 1/10

* Paso 7: Guardar la tercera hoja en un archivo Stata
save df3.dta, replace

* Paso 8: Importar y ver la cuarta hoja (df4)
import excel using "C:\eco-poli\TRABAJO FINAL\CÓDIGO EN R\NUEVO MODELO\STATA\dataframes.xlsx", sheet("df4") clear
describe
list in 1/10

* Paso 9: Guardar la cuarta hoja en un archivo Stata
save df4.dta, replace


* Paso 8: Importar y ver la cuarta hoja (df4)
import excel using "C:\eco-poli\TRABAJO FINAL\CÓDIGO EN R\NUEVO MODELO\df5.xlsx" ,clear
describe
list in 1/10

* Paso 9: Guardar la cuarta hoja en un archivo Stata
save df5.dta, replace



* Renombrar las columnas de df (Hoja 1)
use df.dta, clear
rename A Year
rename B country
rename C capital
save df.dta, replace

* Renombrar las columnas de df2 (Hoja 2)
use df2.dta, clear
rename A Year
rename B country
rename C LaborForce
save df2.dta, replace

* Renombrar las columnas de df3 (Hoja 3)
use df3.dta, clear
rename A country
rename B Year
rename C StudyTime
save df3.dta, replace

* Renombrar las columnas de df4 (Hoja 4)
use df4.dta, clear
rename A country
rename B Year
rename C OverallScore
rename D PropertyRights
rename E GovernmentIntegrity
rename F TaxBurden
rename G GovernmentSpending
rename H BusinessFreedom
rename I MonetaryFreedom
rename J TradeFreedom
rename K InvestmentFreedom
rename L FinancialFreedom
save df4.dta, replace

* Renombrar las columnas de df5 (Hoja 5)
use df5.dta, clear
rename A Year
rename B country
rename C gdp_pc
save df5.dta, replace

use df.dta
browse
use df2.dta, clear
browse
use df3.dta, clear
browse
use df4.dta, clear
browse

* Ver los valores únicos de 'country' y 'Year' en df
use df.dta, clear
list country Year, sepby(country)  

* Ver los valores únicos de 'country' y 'Year' en df2
use df2.dta, clear
list country Year, sepby(country)

 
use df.dta, clear
drop in 1
save df.dta, replace

use df2.dta, clear
drop in 1
save df2.dta, replace


use df3.dta, clear
drop in 1
save df3.dta, replace

use df4.dta, clear
drop in 1
save df4.dta, replace
browse

use df5.dta, clear
drop in 1
save df5.dta, replace


* Paso 1: Importar df y df2
use df.dta, clear

* Paso 2: Realizar el merge con df2
merge 1:1 country Year using df2.dta

* Paso 3: Verificar los resultados del merge
tab _merge

* Paso 4: Mantener solo los registros donde _merge == 3 (coincidencias)
keep if _merge == 3

* Paso 5: Eliminar la columna _merge
drop _merge

* Paso 6: Guardar el nuevo dataset combinado
save merged_data.dta, replace


* Paso 2: Importar df3 y hacer el merge
merge 1:1 country Year using df3.dta
* Verificar nuevamente las coincidencias
tab _merge

* Paso 4: Mantener solo los registros donde _merge == 3 (coincidencias)
keep if _merge == 3

* Paso 5: Eliminar la columna _merge
drop _merge

* Paso 6: Guardar el nuevo dataset combinado
save merged_data.dta, replace

* Paso 3: Importar df4 y hacer el merge
merge 1:1 country Year using df4.dta
* Verificar las coincidencias
tab _merge


* Paso 4: Mantener solo los registros donde _merge == 3 (coincidencias)
keep if _merge == 3

* Paso 5: Eliminar la columna _merge
drop _merge

* Paso 6: Guardar el nuevo dataset combinado
save merged_data.dta, replace


use merged_data, clear
merge 1:1 country Year using df5.dta

* Paso 4: Mantener solo los registros donde _merge == 3 (coincidencias)
keep if _merge == 3

* Paso 5: Eliminar la columna _merge
drop _merge
save merged_data.dta, replace
browse
