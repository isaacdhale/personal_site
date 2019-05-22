# Remember the political survey you took? 
# Let's analyze the (anonymous!) responses of everyone in the class!

# Clear the workspace
rm(list=ls())

#Set the working directory

setwd("F:\\POL 051\\Lab Code")

# Read in external data set. 
classsurvey <- read.csv("survey1_f2018.csv", header=TRUE)

# View the data
View(classsurvey)

#### We'll start with somefeeling thermometers
# First, some descriptive statistics
classsurvey$trump_therm

summary(classsurvey$trump_therm)
summary(classsurvey$dem_therm)
summary(classsurvey$rep_therm)

# How can we interpret these numbers?

# Plots are useful ways to visualize the data
#Partisan approval: Histograms
hist(classsurvey$trump_therm, xlim=c(0,100), ylim=c(0,60), ylab="Frequency", xlab="Approval", col="red", main="Donald Trump Approval", breaks=10)

#Quick aside, this plot is good, but the line of code is SOOOOO long, ugly, and confusing.
#Can we make it any easier to read?
#Yes, we can spread it across multiple lines by line breaking after commas and parentheses as we we fit 

#Same code and same plot, but easier to read code:
hist(
  classsurvey$trump_therm,
  xlim=c(0,100),
  ylim=c(0,60),
  ylab="Frequency",
  xlab="Approval",
  col="red",
  main="Donald Trump Approval",
  breaks=10
  )
#That's some good-looking code!
#We can even add some annotations to help us understand what we're doing

#Same code and same plot, but better presentation:
hist(                                #This command tells R to make a histogram plot 
  classsurvey$trump_therm,           #This specifies what data is used to make the plot.  In this case, the trump_therm variable in the classsurvey dataset
  xlim=c(0,100),                     #This makes the x-axis start at 0 and end at 100 
  ylim=c(0,60),                      #This makes the y-axis starts at 0 and end at 60
  ylab="Frequency",                  #This labels the y-axis "Frequency"
  xlab="Approval",                   #This labels the x-axis "Trump Approval"
  col="red",                         #This colors the plot red
  main="Donald Trump Approval",      #This makes the title "Donald Trump Approval"
  breaks=10                          #This makes each bar 10 points wide
)                                    #This closes the open parenthesis at the start of the command, thereby executing the command


#Let's make some more pretty plots, with some pretty code 

hist(classsurvey$dem_therm, 
     xlim=c(0,100),
     ylim=c(0,60),
     ylab="Frequency", 
     xlab="Approval",
     col="blue", 
     main="Democratic Party Approval", 
     breaks=10)

hist(classsurvey$rep_therm, 
     xlim=c(0,100),
     ylim=c(0,60),
     ylab="Frequency", 
     xlab="Approval",
     col="red", 
     main="Republican Party Approval", 
     breaks=10)

#Boxplots of partisan approval
boxplot(                 #Notice that we're using a different command, so we're going to get a differnt type of plot
  classsurvey$dem_therm, #For the first box
  classsurvey$rep_therm, #For the second box
  col=c("blue","red"),   #This makes the first box blue and and the second one red
  xaxt="n",              #This turns off the marks on the x-axis
  main="Boxplot of party approval ratings", 
  ylab = "Approval of party",
  cex.main=.95           #This makes the font size in the plot 95% as large as usual
  )
axis(                       #This command adds an axis to an existing plot
  1,                        #The number 1 tells R that we're adding an axis at the bottom. (2,3,4) add axes on the left, top, and right side, respectively
  at=c(1,2),                   #This specifies where the marks on the axis go.  In this case, under the first and second boxes
  labels=c("Democratic", "Republican"), #This adds "Democratic" at the first mark and "Republican at the second"
  cex.axis=.9               #This makes the font size 90% as large as usual
  )

#### Subsetting data
# Sometimes you're interested in only part of the sample, for example, men or women
#If it's a 1, it's a boy.  If it's a 2, it's a girl.
classsurvey$gender

#Which respondents are men
which(classsurvey$gender == 1)

#Followup: How many men are there?
length(which(classsurvey$gender == 1))

# One way to look at these parts of the sample is creating a subset
classmen <- subset(classsurvey, classsurvey$gender==1)
View(classmen)

hist(classmen$trump_therm, 
     xlim=c(0,100),
     ylim=c(0,60),
     ylab="Frequency", 
     xlab="Approval",
     col="red", 
     main="Donald Trump approval among men", 
     breaks=10)

# Try using a subset to create a histogram that shows Trump's approval among women
classwomen <- subset(classsurvey, classsurvey$gender == 2)
hist(classwomen$trump_therm, 
     xlim=c(0,100),
     ylim=c(0,60),
     ylab="Frequency", 
     xlab="Approval",
     col="red", 
     main="Donald Trump approval among women", 
     breaks=10)


# What if we wanted to break down a single approval rating by different parties?
# For example, what if we wanted to see Trump's approval among Dems and Reps separately?
# We could subset the data, but in R there's always more than one way to do something

# We'll use the variable "repdem" which classifies whether people are Republicans or Democrats
boxplot(
  classsurvey$trump_therm ~ 
    classsurvey$repdem,
  col=c("blue","red"),
  xaxt="n", 
  main="Boxplot of Trump approval ratings", 
  ylab="Trump Approval",
  cex.main=.95
  )
axis(1, at=1:2, labels=c("Democrats", "Republicans"), cex.axis=.8, las=1)

# Try making a plot of Trump approval by ideology, using the variable "conlib"
# Here, 0 = Liberal, 1 = Conservative
# See if you can interpret the results

# Let's look at party affiliation and ideology
table(classsurvey$pid7)
table(classsurvey$ideo9)

#Turning PID frequencies into percentages
pid_table <- table(classsurvey$pid7)
pid_percent <- pid_table/sum(pid_table)*100
pid_percent

# Barplot of PID
barplot(pid_percent, 
        main="Most respondents identify with Democratic party", 
        xlab="Partisan identity (1=Strong Democrat, 4=Independent, 7=Strong Republican)", 
        ylab="Percent of Sample", 
        ylim=c(0,60),
        cex.lab=.85,
        col=c("blue", "blue", "blue", "purple", "red", "red", "red"))

# I want you to create a barplot of ideology, using the percentage of the sample
# the variable you need is ideo9
# 1 = Strong Liberal, 9 = Strong Conservative
# Once you've created the plot, see if you can save it

##### In vs. Out Party
# What if instead of just Dem therm and Rep therm, 
# we wanted to code it in party vs out party?
# This will help us compare how people view their own party vs the other party.
# We already have a variable for whether they are republicans or democrats, "repdem"

# Now, let's create a new variable for in-party feelings
# This variable will measure how much a person likes their own party
# To create this variable, we first have to identify which party each student supports,
# then extract the level of support for that party.

# To do this, we need to take a look at logical functions.
# Specifically, we want to ask:
# "IF a student likes the Democratic Party, THEN how much do they like the Democratic Party?
# "OTHERWISE, how much do they support the Republican Party?

# This combination of IF, THEN, OTHERWISE lends itself well to the ifelse function
# The ifelse command in English:  "IF A is true, THEN do B. OTHERWISE, do C"
# In ifelse command in R: ifelse(a,b,c)

ifelse(1 == 1, "Hello", "goodbye")
ifelse( 2 + 2 == 4, "nice job", "not today")
ifelse( 2 + 2 > 4, "what?", "take a hike")


classsurvey$inparty <-       #This creates a new variable in classsurvey called inparty
  ifelse(                    #IF a person is... 
  classsurvey$repdem==0,     #...a Democrat...
  classsurvey$dem_therm,     #...THEN their inparty score is their dem_therm score...
  classsurvey$rep_therm      #...OTHERWISE it's their rep_therm score.
  )

hist(classsurvey$inparty)

#Let's do the same to see how people feel about the party they don't like
classsurvey$outparty <-ifelse(
  classsurvey$repdem==1,   #IF a person is a Republican...
  classsurvey$dem_therm,   #...THEN their outparty score is their dem_therm score...
  classsurvey$rep_therm    #...OTHERWISE it's their rep_therm score.
  )


#Now, try and create a box plot of in and out party approval





