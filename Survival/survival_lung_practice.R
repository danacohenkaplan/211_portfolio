### Survival package example code
## ESM 211
## 2/19/25

#The following code is a simplified version of the example here (I did NOT create it, I only simplified it!): 
# https://bioconnector.github.io/workshops/r-survival.html#getting_started

# Let's get the necessary libraries loaded: 

library(survival) #For survival analysis
library(survminer) #For visualizing the results of the survival analysis
library(dplyr) #For data manipulation and transformation. 

#Get information about lung cancer survival data

?lung 

#Note that no downloading of the data is necessary!

#Take a look at the data. 
head(lung) 
class(lung)
dim(lung)
View(lung)

#Convert this data into a tibble so that is easy to manipulate. 
lung <- as_tibble(lung) # be sure to give your tibble a name. 
lung 

#Now create the survival object and then fit that object to a curve: 
sfit <- survfit(Surv(time, status)~sex, data=lung)
plot(sfit)

#For help understanding survival objects and survival curves: 

?surv

?survfit

#Now use ggsurvplot to make this look a little nicer and be a bit more informative. 
ggsurvplot(sfit)


# Now, make your plot lovely and informative, and include a risk table. 

ggsurvplot(sfit, conf.int=TRUE, pval=TRUE, risk.table=TRUE, 
           legend.labs=c("Male", "Female"), legend.title="Sex",  
           palette=c("dodgerblue2", "orchid2"), 
           title="Kaplan-Meier Curve for Lung Cancer Survival", 
           risk.table.height=.15)

# Well done! 


# Check out this website if you want to learn more from this example: https://bioconnector.github.io/workshops/r-survival.html#getting_started


##HW


#Read in data
quagga_data <- read.csv('Davis_quagga_mussels.csv')

head(quagga_data) 
View(quagga_data)

Nine_ppm_quagga <- quagga_data |>
  filter(quagga_data$treatment == "9_ppm_Ca")

Nine_ppm_quagga <- quagga_data |>
  filter(quagga_data$treatment == "9_ppm_Ca")

Twelve_ppm_quagga <- quagga_data |>
  filter(quagga_data$treatment == "12_ppm_Ca")

#Convert this data into a tibble so that is easy to manipulate. 
quagga_tibble <- as_tibble(quagga_data) # be sure to give your tibble a name. 
quagga_tibble 

#Now create the survival object and then fit that object to a curve: 
sfit <- survfit(Surv(day, status)~treatment, data=quagga_tibble)
plot(sfit)

# Now, make your plot lovely and informative, and include a risk table. 

ggsurvplot(sfit, conf.int=TRUE, pval=TRUE, risk.table=TRUE, 
           legend.labs=c("Nine_ppm", "Twelve_ppm"), legend.title="ppm_Ca",  
           palette=c("dodgerblue2", "orchid2"), 
           title="Kaplan-Meier Curve: Quagga Survival ppm CA", 
           risk.table.height=.15)


