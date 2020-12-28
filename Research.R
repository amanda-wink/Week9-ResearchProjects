library(rredis)
redisConnect(host="localhost", port=6379, nodelay=TRUE)

happiness <- read.csv("/Users/amanda/Documents/PythonProjects/Week9-ResearchProjects/happiness_report_2019.csv")
for (row in 1:nrow(happiness))
{
  redisHMSet(paste0('happiness:',happiness[row,1]) , happiness[row,])
}
print("Information in Redis")

