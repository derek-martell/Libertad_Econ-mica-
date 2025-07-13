cd "C:\eco-poli\TRABAJO FINAL\CÓDIGO EN R\NUEVO MODELO\STATA"
use merged_data

xtset country_code Year

pwcorr gdp_pc k freedom corruption study_mean, sig


gen ln_y = ln(gdp_pc)
gen ln_k = ln(k)
gen ln_free = ln(freedom)
gen ln_stud = ln(study_mean)
gen ln_corr = ln(corruption)

findit xtcsd
xtreg ln_y ln_k freedom ln_stud, re



* Breusch and Pagan Lagrangian multiplier test for random effects (Panel Largo)
* Ho: Usar MCO ( > .05)
* H1: Usar Panel de Datos ( < .05) Existe heterogeneidad no observada
xttest0

* Pesaran's test of cross sectional independence  (Panel corto)
* Ho: Usar MCO ( > .05)
* H1: Usar Panel de Datos ( < .05) Existe heterogeneidad no observada

xtcsd, pesaran abs



* El bin te dice en cuántos intervalos lo vas a dividir
histogram gdp_pc, bin(30) normal
histogram ln_y, bin(30) normal

histogram k, bin(30) normal
histogram ln_k , bin(30) normal

reg ln_y ln_k free ln_stud, robust cluster(country)

xtreg ln_y ln_k ln_free  ln_stud, fe
estimates store fixed

xtreg ln_y ln_k ln_free ln_stud, re
estimates store random

asdoc hausman fixed random

vif

estat hettest


findit xtserial

xtreg ln_y ln_k ln_free ln_stud, fe
xtserial ln_y ln_k ln_free ln_stud, output


xtreg ln_y ln_k ln_free ln_stud, fe
xttest3


Para correr un modelo con autocorrelación y heteroc
xtpcse ln_y ln_k ln_free ln_stud, het c(ar1)
xtgls ln_y ln_k ln_free ln_stud, p(h) c(ar1)