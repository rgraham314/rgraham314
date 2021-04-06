# Create 6 characteristics = I / W / Ch / S / D / C
characteristics<-c(INT=0,WIS=0,CHR=0,STR=0,DEX=0,CON=0)
exStr<-FALSE

for (i in 1:6){
  a<-c(dice(6,4))  #roll 4d6
  adjsum <- sum(a)-a[which.min(a)]  #remove least value and sum
  characteristics[i]<-adjsum
}

### Check if stats are too low
reroll <- 0
rep <- 0

repeat{
  if(characteristics[1] < 6){
    for(i in 2:6){
      if(characteristics[i] < 6){
        reroll <- 1
      }
    }
  } else if(characteristics[2] < 6){
    for(i in 3:6){
      if(characteristics[i] < 6){
        reroll <- 1
      }
    }
  } else if(characteristics[3] < 6){
    for(i in 4:6){
      if(characteristics[i] < 6){
        reroll <- 1
      }
    }
  } else if(characteristics[4] < 6){
    for(i in 5:6){
      if(characteristics[i] < 6){
        reroll <- 1
      }
    }
  } else if(characteristics[5] < 6){
    if(characteristics[6] < 6){
      reroll <- 1
    }
  }
  
  if(reroll == 1){
    for (i in 1:6){
      a<-c(dice(6,4))
      adjsum <- sum(a)-a[which.min(a)]
      characteristics[i]<-adjsum
      reroll <- 0
    }
  }
  
  if(reroll == 1){
    rep <- 1
  } else {
    rep <- 0
  }
  
  if(rep == 0){
    break
  }
}

print("new characteristics = ", sep="", quotes=FALSE)
print(characteristics)

