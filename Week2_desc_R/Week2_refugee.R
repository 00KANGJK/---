#### Read-in the refugees data

refugees.df <- read.csv("population.csv", header = TRUE)  # load data
dim(refugees.df)  # find the dimension of data frame
head(refugees.df)  # show the first six rows
View(refugees.df)  # show all the data in a new tab
names(refugees.df)  # print a list of variables to the screen.

colnames(refugees.df)[1] <- c("Year")  # change the 1st column's name
colnames(refugees.df)[2] <- c("Country.of.origin")  # change the column2's name
colnames(refugees.df)[3] <- c("Country.of.origin.ISO")  # change the 3 column3's name
colnames(refugees.df)[4] <- c("Country.of.asylum")  # change the first column4's name
colnames(refugees.df)[5] <- c("Country.of.asylum.ISO")  # change the first column5's name
colnames(refugees.df)[6] <- c("Refugees.under.UNHCR.mandate")  # change the first column6's name
colnames(refugees.df)[7] <- c("Asylum.seekers")  # change the first column7's name
colnames(refugees.df)[8] <- c("Returned.refugees")  # change the first column8's name
colnames(refugees.df)[9] <- c("IDPs.of.concern.to.UNHCR")  # change the first column9's name
colnames(refugees.df)[10] <- c("Returned.IDPs")  # change the first column10's name
colnames(refugees.df)[11] <- c("Stateless.persons")  # change the first column11's name
colnames(refugees.df)[12] <- c("Others.of.concern")  # change the first column12's name
colnames(refugees.df)[13] <- c("Venezuelans.displaced.abroad")  # change the first column13's name

summary(refugees.df)  # find summary statistics for each column

#### Plotting: histogram
library(car)
head(refugees.df)
hist(refugees.df$Asylum.seekers)

#### Plotting: bar chart
library(ggplot2)
a <- data.frame(refugees.df$Year,refugees.df$Refugees.under.UNHCR.mandate)

ggplot(data=a, aes(x=refugees.df.Year, y=refugees.df.Refugees.under.UNHCR.mandate))+
  geom_bar(stat="identity")

a2 <- data.frame(refugees.df$Year,refugees.df$Venezuelans.displaced.abroad)

ggplot(data=a2, aes(x=refugees.df.Year, y=refugees.df.Venezuelans.displaced.abroad))+
  geom_bar(stat="identity")

# Simple scatterplot
attach(refugees.df)
plot(Refugees.under.UNHCR.mandate, Asylum.seekers, main="Refugees under UNHCR W.R.T. Asylum seekers",
     xlab="Asylum seekers ", ylab="Refugees under UNHCR mandate ", pch=13)
# Add fit lines
abline(lm(Refugees.under.UNHCR.mandate~Asylum.seekers, ), col="red") # regression line (y~x)
lines(lowess(Refugees.under.UNHCR.mandate,Asylum.seekers, ), col="blue") # lowess line (x,y)
