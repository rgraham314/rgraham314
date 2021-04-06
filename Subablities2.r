#Determine stat splits - if value is > 12 && < 17 then split by 2. If value is 17 then split by 1. Otherwise leave value alone.
subabilityTbl <- data.frame(characteristics, characteristics)
colnames(subabilityTbl) <- c("Stat1", "Stat2")

for (i in 1:6){
  if(characteristics[i] > 12 && characteristics[i] < 17){
    x <- 0
    x <- dice(2,1)
    #print(x)
    if (x == 1){
      subabilityTbl[i,1] <- characteristics[i] - 2
      subabilityTbl[i,2] <- characteristics[i] + 2
    } else if(x==2){
      subabilityTbl[i,1] <- characteristics[i] + 2
      subabilityTbl[i,2] <- characteristics[i] - 2
    } 
  }
  if(characteristics[i] == 17) {
    x <- dice(2,1)  
    if (x == 1){
      subabilityTbl[i,1] <- characteristics[i] - 1
      subabilityTbl[i,2] <- characteristics[i] + 1
    } else if(x==2){
      subabilityTbl[i,1] <- characteristics[i] + 1
      subabilityTbl[i,2] <- characteristics[i] - 1
    }
  } 
}

print(characteristics)
print(subabilityTbl)
