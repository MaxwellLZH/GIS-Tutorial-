#introduction to reshape2
library(reshape2)
library(plyr)
#using built-in airquality package
head(airquality)

aql <- melt(airquality)
head(aql,20)

aql <- melt(airquality, id.vars = c('Month', 'Day'), value.name = 'climate value')
head(aql)

#dcast(id.vars ~ measured variable)
aqw <- dcast(aql, Month + Day ~ variable)

#if you only cast using Month, see what happens
dcast(aql, Month ~ variable) #the Ozone, Scolar.R, Wind, Temp are the # of rows

#so we want to know the mean value instead of the count
dcast(aql, Month ~ variable, fun.aggregate = mean, na.rm = T)

dcast(aql, Month ~ variable, subset = .(Month == 5)) #quoted expression for subsetting
                                                     #see plyr documentation for more info

acast(aql, Month ~ ., fun.aggregate = sum, na.rm = T )#. for no other variables

#recast: the combination to melt and cast
recast(airquality, id.var = c('Month','Day'), Month ~ variable)


