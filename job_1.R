counts <- seq(10000,500000, by=10000)

time=data.frame(counts=as.numeric(),
                first=as.numeric(),
                second=as.numeric(),
                stringsAsFactors = FALSE)

trans <- c("1"="low", "2"="medium", "3"="high", "999"="Not-available")


for(i in counts){

df <- data.frame(ID=1:i, value=sample(c(1,2,3,999), i, replace = T))

start <- Sys.time()
for(i in 1:nrow(df)){
    df$class[i] <- if(df$value[i]==1){
        "low"
    } else if(df$value[i]==2){
        "middle"
    }else if(df$value[i]==3) {
        "high"
    } else{
        "Not-available"
    }
}
end <- Sys.time()
first<- as.numeric(end-start,units="secs")


# setting a translation vector


start <- Sys.time()
df$class <- unname(trans[as.character(df$value)])
end <- Sys.time()
second <- as.numeric(end-start,units="secs")


time <- rbind(time, data.frame(i,first, second))
}

plot(time$second, time$first)
