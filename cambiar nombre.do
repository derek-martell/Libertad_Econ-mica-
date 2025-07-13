cd "C:\eco-poli\TRABAJO FINAL\CÓDIGO EN R\NUEVO MODELO\STATA"
use merged_data
browse

* Crear un código numérico para cada país
encode country, gen(country_code)
destring Year, replace
* Definir los datos como panel
xtset country_code Year

asdoc summarize
xtdescribe

describe

rename Study study_mean
rename OverallScore freedom
rename PropertyRights property
rename GovernmentInt~y corruption               
rename TaxBurden tax                
rename GovernmentSpe~g gov_spen            
rename BusinessFreedom busin_free                
rename MonetaryFreedom mone_free               
rename TradeFreedom trade_free                
rename InvestmentFre~m inver_free                
rename FinancialFree~m finan_free        
                                 

save merged_data.dta, replace




