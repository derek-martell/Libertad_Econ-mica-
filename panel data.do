* Establecer el directorio de trabajo
cd "C:\eco-poli\TRABAJO FINAL\CÓDIGO EN R\NUEVO MODELO\STATA"

* Cargar el conjunto de datos
use merged_data, clear

* Establecer la estructura de datos de panel (panel data)
xtset country_code Year

* Correlación entre las variables, mostrando los valores significativos
asdoc pwcorr gdp_pc k freedom study_mean, sig
asdoc pwcorr ln_y ln_k freedom ln_stud, sig
asdoc summ
* Generar las variables logarítmicas
gen ln_y = ln(gdp_pc)
gen ln_k = ln(k)
gen ln_free = ln(freedom)
gen ln_stud = ln(study_mean)
gen ln_corr = ln(corruption)


* Histogramas para visualizar las distribuciones de las variables
histogram gdp_pc, bin(30) normal
histogram ln_y, bin(30) normal
histogram k, bin(30) normal
histogram ln_k, bin(30) normal



* Buscar el comando xtcsd
findit xtcsd

* Regresión de efectos aleatorios
xtreg ln_y ln_k freedom ln_stud, re

* Prueba de Breusch y Pagan para efectos aleatorios (Panel Largo)
* H0: Usar MCO (p-valor > 0.05)
* H1: Usar Panel de Datos (p-valor < 0.05), existe heterogeneidad no observada
xttest0

* Prueba de Pesaran para independencia de las secciones transversales (Panel Corto)
* H0: Usar MCO (p-valor > 0.05)
* H1: Usar Panel de Datos (p-valor < 0.05), existe heterogeneidad no observada
xtcsd, pesaran abs


* Regresión robusta con cluster por país
reg ln_y ln_k free ln_stud, robust cluster(country_code)
* Comprobación de multicolinealidad (VIF)
asdoc vif

* Regresión robusta con cluster por país
asdoc reg gdp_pc k freedom study_mean, replace
asdoc reg ln_y ln_k freedom ln_stud, replace
reg gdp_pc k freedom study_mean, robust cluster(country_code)
* Comprobación de multicolinealidad (VIF)
asdoc vif




* Regresión de efectos aleatorios (Random Effects)
xtreg ln_y ln_k freedom ln_stud, re
estimates store random

* Regresión de efectos fijos (Fixed Effects)
xtreg ln_y ln_k freedom ln_stud, fe
estimates store fixed
xttest0



reg ln_y ln_k freedom ln_stud
estimates store pooled


test [fixed] = [pooled]
xttest0




* Prueba de Hausman para comparar los modelos de efectos fijos y aleatorios
asdoc hausman fixed random





* Buscar el comando xtserial para la prueba de autocorrelación
findit xtserial

* Regresión de efectos fijos y prueba de autocorrelación
xtreg ln_y ln_k freedom ln_stud, fe
asdoc xtserial ln_y ln_k freedom ln_stud, output

* Regresión de efectos fijos y prueba de heterocedasticidad
xtreg ln_y ln_k freedom ln_stud, fe
xttest3 






* Correr un modelo con autocorrelación y heterocedasticidad
asdoc xtpcse ln_y ln_k freedom ln_stud, het c(ar1)
asdoc xtgls ln_y ln_k freedom ln_stud, p(h) c(ar1)
