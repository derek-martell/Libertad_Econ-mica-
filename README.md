# Efecto de la Libertad Económica en el crecimiento de los países Latinoaméricanos

En este repositorio estan las pruebas estadísticas, y econométricas. Para poder realizar el trabajo de investigación económico, sobre cuál es el efecto de la libertad ecónomica en el crecimiento del PBI en los países en latinoamérica, desde el año 1995 hasta el año 2023.

Los países elegidos fueron: 
* Perú
* Bolivia
* Ecuador
* Colombia
* Guatemala
* México


Tras los test de autocorrelación y de heterecedasticidad donde se detectan ambas. Por lo que se usa los modelos de Prais-Winsten y FGLS (Generalized Least Squares).


Algunas aclaraciones para la lectura de los documentos.
Los datos están agrupados en dataframes.xlsx. Y desagregados en los archivos dta, df.dta hasta df5.dta. Luego la unión de estas cinco base de datos nos da merged_data.
El proceso para poder realizar lo anterior debemos utilizar los archivos .do, merged.do, cambiarnombre.do, y parte2.do.

Para visualizar las pruebas y modelos económétrica consultar el archivo panel data.do

Nota: La prueba F , fue realizada en F, ya que no se pudo realizar en Stata.
