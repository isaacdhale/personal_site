#Fun with correlation!

#Set the working directory
setwd("F:\\POL 051\\Lab Code")

# Activate the package with the following command: library(nameofpackage)
library(foreign)

# Read in external data set. 
problemset<-read.dta("section_data.dta")


#Let's jump right in by seeing if respondents' ideology is correlated to their party preference

#To start, let's eyeball it
plot(               #Plot Command
  problemset$ideo9, #Ideology Score, from liberal and conservative
  problemset$pid7   #Partisan Support, from Democrat to Republican
)                   #End Command

#Well, that isn't very helpful.
#This data just doesn't lend itself well to a scatterplot.
#Looks like our options are to either use a more complicated plot (boooo)
#or simply to see what the correlation is, so let's do that.

cor(                            #Correlation Command
  problemset$ideo9,             #Ideology Score, from liberal and conservative
  problemset$pid7,              #Partisan Support, from Democrat to Republican
  use = "pairwise.complete.obs" #Tells R to ignore a person if they don't have an ideology or party score
)                               #End Command

#Since we've been gone for a while,
#Remember that the command above is the same as:
cor(problemset$ideo9,problemset$pid7,use = "pairwise.complete.obs")

#That result makes sense, right?
#Let's try another one

#Is a respondent's support for a border wall correlated with their support for the Border Patrol?

cor(                            #Correlation command
  problemset$support_wall,      #Support for the wall, from 0 to 7
  problemset$support_bp,        #Support for the Border Patrol, from 0 to 7
  use = "pairwise.complete.obs" #Tells R to ignore a person if they didn't answer either question
)                               #End command

#Is that result surprising?


#Let's compare some variables that are less directly related.
#What's the correlation between one's support for Republicans and support for the wall?

cor(                            #Correlation Command
  problemset$pid7,              #Support for Republicans
  problemset$support_wall,      #Support for the wall
  use = "pairwise.complete.obs" #Tells R to ignore a person if they didn't answer either question
)                               #End command

#And between going to UC Davis and being Latino 
cor(                            #Correlation Command
  problemset$ucd,               #Are you a UCD student or not
  problemset$R_latino,          #Are you Latino
  use = "pairwise.complete.obs" #Tells R to ignore a person if they didn't answer either question
)                               #End Command

#And between going to UC Davis and going to Texas A&M 
cor(                            #Correlation Command
  problemset$ucd,               #Are you a UCD student or not
  problemset$TAMU,              #Are you a Texas Student
  use = "pairwise.complete.obs" #Tells R to ignore a person if they didn't answer either question
)                               #End Command

#Hey!  A negative correlation.  Neat.
#Fun extra question:  Why isn't this correlation exactly -1 ?

#Great!  So now we know how to find the correlation between two variables.
#But we should also try to discover whether these correlations are *significant*
#Correlations can be deceiving, because small correlations can be significant,
#while large correlations can be insignificant.

#Significance basically asks,
# "What is the probability of observing a correlation this large by chance?"
# If the probability is low, then the results are significant.
# If the probability is high, then the results are insignificant.
# Usually, the cutoff between significant and insignificant is 5%.


#Let's double back and look at the correlation between ideology and party id...
cor.test(                       #Correlation test Command
  problemset$ideo9,             #Ideology Score, from liberal and conservative
  problemset$pid7,              #Partisan Support, from Democrat to Republican
  use = "pairwise.complete.obs" #Tells R to ignore a person if they don't have an ideology or party score
)                               #End Command

# ...and between support for the wall and for the Border Patrol...
cor.test(                       #Correlation test command
  problemset$support_wall,      #Support for the wall, from 0 to 7
  problemset$support_bp,        #Support for the Border Patrol, from 0 to 7
  use = "pairwise.complete.obs" #Tells R to ignore a person if they didn't answer either question
)

# ...and between party id and support for the wall...
cor.test(                       #Correlation test Command
  problemset$pid7,              #Support for Republicans
  problemset$support_wall,      #Support for the wall
  use = "pairwise.complete.obs" #Tells R to ignore a person if they didn't answer either question
)                               #End command

#And between going to UC Davis and being Latino 
cor.test(                       #Correlation test command
  problemset$TAMU,               #Are you a UCD student or not
  problemset$R_latino,          #Are you Latino
  use = "pairwise.complete.obs" #Tells R to ignore a person if they didn't answer either question
)                               #End Command

#Finally, an insignificant correlation, which is hard to find in a dataset this large.


cor.test(                       #Correlation test command
  problemset$ucd,               #Are you a UCD student or not
  problemset$TAMU,              #Are you a Texas A&M Student
  use = "pairwise.complete.obs" #Tells R to ignore a person if they didn't answer either question
)                               #End Command


