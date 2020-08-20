complete <- function(directory,id=1:332)
{
  #my_wd <- getwd()
  #setwd(file.path(my_wd,directory))
  
  num_Files=length(id)
  MyFiles <- sprintf("%03d.csv", id)
  filePaths <- paste(directory, MyFiles, sep="/")
  My_Data <- matrix(ncol=2, nrow=num_Files)
  for(i in 1:num_Files)
  {
    My_Data[i,]= c(id[i],sum(complete.cases(read.csv(filePaths[i]))))
  }
  My_Data <- setNames(data.frame(My_Data),c("id","nobs"))
  My_Data

  #setwd(my_wd)
}