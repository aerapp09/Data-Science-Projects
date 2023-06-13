myPeople = read.table(file =file.choose(),
                      header=T, sep = " ",
                      na.strings= " ",
                      stringsAsFactors=F)
donnaRecord = data.frame(fname = "Donna",
                         lname = "Heyward",
                         sex="female")
myPeople = rbind(myPeople, donnaRecord)

myPeople[7,2] = 'Marx'
write.table(x=myPeople, file=file.choose(),
            sep=" ", na= " ", quote=F, row.names=F)

head(myPeople,3)
tail(myPeople, 3)


