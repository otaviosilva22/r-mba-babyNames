#the packages was inatalled using RStudio interface tools

#loading libraries
library(RSQLite)
library(dplyr)
library(tidyr)
library(arules)
library(arulesSequences)
library(readr)
library(visNetwork)
library(igraph)
library(lubridate)
library(DT)
library(ggplot2)

#define workspace
setwd("C:/Users/Otávio/Desktop/Data_Analytics")

#connection database
con = dbConnect(RSQLite::SQLite(), dbname="database.sqlite")

#tables
alltables = dbListTables(con)
alltables

#data tables
national_names = dbReadTable(con, "NationalNames")
state_names = dbReadTable(con, "StateNames")

#view data from table names
View(national_names)
View(state_names)

#here start a general analysis

#histogram of different names born
ggplot(aes(x = Year), data = national_names) +
  geom_histogram(binwidth = 1) + 
  xlim(1880,2014)  +
  ylim(0, 45000) +
  ggtitle('Número de nomes registrados de bebês por ano') +
  xlab('Ano') + 
  ylab('Quantidade')

#array state_names and count
array_names=c(state_names$Name)
array_states=c(state_names$State)
array_count=c(state_names$Count)

#create a data_frame from arrays
df = data.frame(array_names, array_states, array_count)

#group names by state
group_state_names = df %>%
  group_by(Name = array_names, State = array_states) %>%
  summarise(Total = sum(array_count))

#here start a specific analysis with latin names

#most popular biblical names
latin_names = group_state_names[ which(group_state_names$Name == "Rosa" |
                                             group_state_names$Name == "Alejandra" |
                                             group_state_names$Name == "Margarita"|
                                             group_state_names$Name == "Juana" |
                                             group_state_names$Name == "Francisca" |
                                             group_state_names$Name == "Yolanda" |
                                             group_state_names$Name == "Guadalupe" |
                                             group_state_names$Name == "Paulina" |
                                             group_state_names$Name == "Paola" |
                                             group_state_names$Name == "Melanie" |
                                             group_state_names$Name == "Virginia" |
                                             group_state_names$Name == "Micaela" |
                                             group_state_names$Name == "Milagros" |
                                             group_state_names$Name == "Romina" |
                                             group_state_names$Name == "Alma" |
                                             group_state_names$Name == "Gael" |
                                             group_state_names$Name == "Juan" |
                                             group_state_names$Name == "Miguel" |
                                             group_state_names$Name == "Anjel" |
                                             group_state_names$Name == "Alejandro" |
                                             group_state_names$Name == "Antonio" |
                                             group_state_names$Name == "Esteban" |
                                             group_state_names$Name == "Martin" |
                                             group_state_names$Name == "Javier" |
                                             group_state_names$Name == "Alonzo" |
                                             group_state_names$Name == "Dario" |
                                             group_state_names$Name == "Berto" |
                                             group_state_names$Name == "Castel" |
                                             group_state_names$Name == "Santino" |
                                             group_state_names$Name == "Jose" |
                                             group_state_names$Name == "Maria"), ]


#arrays to names, state and total
array_latin_names=c(latin_names$Name)
array_latin_state=c(latin_names$State)
array_latin_total=c(latin_names$Total)

#create a data_frame from arrays
df_latin_names = data.frame(array_latin_names, array_latin_state, array_latin_total)

#group total biblical names by state
group_latin = df_latin_names %>%
  group_by(State = array_latin_state) %>%
  summarise(Total = sum(array_latin_total))

colnames(group_latin) = c("state", "count")

#plot bar chart to total latin names by state
ggplot(aes(x = state, y = count, fill = state), 
       data = group_latin) +
  geom_bar(stat = 'summary',
           fun.y = 'sum') +
  ggtitle('Total de nomes latinos por estado') +
  xlab('Estado') + 
  ylab('Total')

#here start a specific analysis with biblical names

#most popular biblical names
biblical_names <- group_state_names[ which(group_state_names$Name == "Peter" |
                                             group_state_names$Name == "Andrew" |
                                             group_state_names$Name == "James"|
                                             group_state_names$Name == "John" |
                                             group_state_names$Name == "Philip" |
                                             group_state_names$Name == "Bartholomew" |
                                             group_state_names$Name == "Thomas" |
                                             group_state_names$Name == "Mathew" |
                                             group_state_names$Name == "Thaddeus" |
                                             group_state_names$Name == "Simon" |
                                             group_state_names$Name == "Judas" |
                                             group_state_names$Name == "Abraham" |
                                             group_state_names$Name == "David" |
                                             group_state_names$Name == "Isaac" |
                                             group_state_names$Name == "Jacob" |
                                             group_state_names$Name == "Joseph" |
                                             group_state_names$Name == "Luke" |
                                             group_state_names$Name == "Mark" |
                                             group_state_names$Name == "Paul" |
                                             group_state_names$Name == "Esther" |
                                             group_state_names$Name == "Eve" |
                                             group_state_names$Name == "Martha" |
                                             group_state_names$Name == "Mary" |
                                             group_state_names$Name == "José" |
                                             group_state_names$Name == "Maria"), ]


#arrays to names, state and total
bib_names=c(biblical_names$Name)
bib_states=c(biblical_names$State)
bib_count=c(biblical_names$Total)

#create a data_frame from arrays
df_biblical = data.frame(bib_names, bib_states, bib_count)

#group total biblical names by state
group_biblical = df_biblical %>%
  group_by(State = bib_states) %>%
  summarise(Total = sum(bib_count))

colnames(group_biblical) = c("state", "count")

#plot bar chart to total biblical names by state
ggplot(aes(x = state, y = count, fill = state), 
       data = group_biblical) +
  geom_bar(stat = 'summary',
           fun.y = 'sum') +
  ggtitle('Total de nomes bíblicos por estado') +
  xlab('Estado') + 
  ylab('Total')
