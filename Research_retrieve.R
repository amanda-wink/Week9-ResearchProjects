library(rredis)
redisConnect(host="localhost", port=6379, nodelay=TRUE)

keys <- redisKeys(pattern='happiness:*')
keys2 <- keys[!keys %in% 'happiness:1']
final <- redisHGetAll('happiness:1')
for (key in keys2)
{
  final <- rbind(final, redisHGetAll(key), deparse.level=0)
}
write.csv(final, "Documents/PythonProjects/Week9-ResearchProjects/happiness.csv")
print("Information retrieved")