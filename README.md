# Análise Exploratória com R
### Aplicação desenvolvida em linguagem R para análise exploratória de um banco de dados de nomes de bebês presente no Kaggle.

## Tecnologias Utilizadas
- [R](https://www.r-project.org/)
- [ggplot2](https://ggplot2.tidyverse.org/)
- [dplyr](https://dplyr.tidyverse.org/)
- [RSQLite](https://cran.r-project.org/web/packages/RSQLite/vignettes/RSQLite.html)

## Download da base de dados.
### O banco utilizado pode ser baixado clicando <a href='https://www.kaggle.com/kaggle/us-baby-names'>aqui</a>

## Leitura do Banco de Dados
### Para utilizar a base é necessário antes instalar e carregar os pacotes instalados, bem como definir um caminho de pasta padrão do projeto. Após isso, basta realizar a importação a partir do comando ```dbConnect```.

~~~JavaScript
#define workspace
setwd("<path>")

#connection database
con = dbConnect(RSQLite::SQLite(), dbname="database.sqlite")
});
~~~

## Autores
### <b>Otávio Silva</b>

[![Linkedin Badge](https://img.shields.io/badge/-LinkedIn-blue?style=flat-square&logo=Linkedin&logoColor=white&link=https://www.linkedin.com/in/otaviosilva22/)](https://www.linkedin.com/in/otaviosilva22/)
[![Gmail Badge](https://img.shields.io/badge/-Gmail-c14438?style=flat-square&logo=Gmail&logoColor=white&link=mailto:otavio.ssilva22@gmail.com)](mailto:otavio.ssilva22@gmail.com)

### <a href='https://github.com/MarcosP-Andrade'><b>Marcos Andrade</b><a>
