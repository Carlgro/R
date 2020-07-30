library("readxl")
sheets = c(excel_sheets(pt))
db = list()

for(i in 2:length(sheets)){
  db[[i - 1]] = read_excel(pt, sheet = i)
}

tmp <- data.frame(cp=c(),municipio=c())
tmp <- db[[1]][,c(1,4,6,5)]

for(i in 2:length(db)){
  tmp<-rbind(tmp,db[[i]][,c(1,4,6,5)])
}

tmp<-unique(tmp)
colnames(tmp)<-c('cp','municipio','ciudad','estado')
head(tmp)

tmp[tmp$cp==78170,] # SLP
tmp[tmp$cp==11320,] # Miguel Hidalgo
tmp[tmp$cp==79610,] # Rio Verde

write.csv(tmp, 'cp_mexico', row.names = FALSE)

