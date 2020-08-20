pollutantmean <- function(directory,pollutant,id=1:332)
{
    my_wd <- getwd()
    setwd(file.path(my_wd,directory))
    id <- format(id,FALSE,,,,3)
    id <- gsub("\\s","0",id)
    WorkingFiles <- sapply(id,function(x){list.files(pattern = x)})
    WorkingData <- lapply(WorkingFiles,read.csv,header = TRUE)
    WorkingData <- do.call(rbind.data.frame,WorkingData)
    WD_mat <- data.frame(lapply(WorkingData, "length<-", max(lengths(WorkingData))))
    if(pollutant=='sulfate')
      {pollutant=2}
    if(pollutant=='nitrate')
      {pollutant=3}
    selWD <- WD_mat[,pollutant]
    na_Data <- which(!complete.cases(selWD))
    WD_mat_no_na <- selWD[-na_Data] 
    print(mean(WD_mat_no_na))
    setwd(my_wd)
}