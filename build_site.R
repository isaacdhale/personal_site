rm(list=ls())

setwd("C:\\Users\\Isaac\\Google Drive\\Website\\Attempt_2\\personal_site")

#install.packages("rmarkdown", type = "source")
library(rmarkdown)
library(knitr)

rmarkdown::render_site()


####Useful Terminal commands

# Set WD
# cd "C:\Users\Isaac\Google Drive\Website\Attempt_2\personal_site"

# Add all files to staging area
#git add -A 
#the -A flag tells it git you want everything


## BUild website locally
#git commit -m "update"

#Push website to github
#git push origin master

#Create a blank file
# touch X.rmd 
# touch Y.css