# Intro-to-Time-Series-Analysis-in-R

# Coursera guided project learning and practicing time series analysis in R. Course taught by Vinod Bakthavachalam.

# Coursera's description of course:

"In this 2 hour long project-based course, you will learn the basics of time series analysis in R. By the end of this project, you will understand the essential theory for time series analysis and have built each of the major model types (Autoregressive, Moving Average, ARMA, ARIMA, and decomposition) on a real world data set to forecast the future. We will go over the essential packages and functions in R as well to make time series analysis easy."

# Coursera's description of project objectives:

1. "Introduction to Rhyme Environment"

2. "Time Series Data Overview (Theory)"

3. "Why Time Series? (Theory)"

4. "Key Concepts: Autocorrelation / Autocovariance (Theory)"

5. "Key Concepts: Stationarity (Theory)"

6. "Checking for Stationarity (Practice)"

7. "Transforming for Stationarity: Differencing (Practice)"

8. "Transforming for Stationarity: Detrending (Practice)"

9. "Basic Model Types: AR(p), MA(q), ARMA(p,q), ARIMA(p,d,q), Decomposition (Theory)"

10. "Fitting AR / MA / ARMA / ARIMA models with the Box Jenkins Method (Theory)"

11. "Box Jenkins Method: Checking for Stationarity (Practice)"

12. "Box Jenkins Method: Transforming for Stationarity & Identifying Model Parameters (Practice)"

13. "Box Jenkins Method: Checking the Residuals of the Model Fit (Practice)"

14. "Making a Forecast for Each Model (Practice)"

15. "Fitting STL (Seasonal Trend Loess) Decomposition Models (Practice)"

16. "Where to go Next"

# R libraries used:

library(IRdisplay), library(magrittr), library(tidyverse), library(scales), library(gridExtra), library(forecast), library(tseries), library(ggthemes), theme_set(theme_economist())

# R functions used:

setwd, source, print, display_png, sim.random.walk, ggplot, ggAcf, sim.stationary.example, head, dim, grid.arrange, adf.test, lag, resid, lm, read.csv, class, as.Date, auto.arima, Box.test, forecast, autoplot, ts, stl, 

# Project deliverable highlights

# 4. "Key Concepts: Autocorrelation / Autocovariance (Theory)"

#function to similate random walk
sim.random.walk <- function(seed=30,n=1000,random.mean=0,random.sd=1)

{data.frame("t"=1:n,"X"=cumsum(rnorm(n,random.mean,random.sd)))}

#simulate random walk

dat<-sim.random.walk()

#plot random walk

dat %>% ggplot(aes(t,X)) + geom_line() + xlab("T") + ylab("X") + ggtitle("Time Series Plot")

![4  Time Series Plot](https://github.com/NollieAnalysis/Intro-to-Time-Series-Analysis-in-R/assets/163913188/394a7c2f-8a4c-4b47-9232-a1e96fc76b8c)

#ACF plot

ggAcf(dat$X,type="correlation") + ggtitle("Autocorrelation ACF Plot")

![4  ACF Plot](https://github.com/NollieAnalysis/Intro-to-Time-Series-Analysis-in-R/assets/163913188/2179cd6e-ef85-44f0-a79b-8c8af03ea9f5)

#PACF plot

ggAcf(dat$X,type="partial") + ggtitle("Partial Autocorrelation PACF Plot")

![4  PACF Plot](https://github.com/NollieAnalysis/Intro-to-Time-Series-Analysis-in-R/assets/163913188/ab120929-ac2b-4eea-9525-e3ffd402b650)

# 6. "Checking for Stationarity (Practice)"

#create three time series for example

df <- sim.stationary.example(n=1000)

head(df);dim(df)

![6  Table](https://github.com/NollieAnalysis/Intro-to-Time-Series-Analysis-in-R/assets/163913188/4d565aae-562b-405e-beef-8060c7a67614)

#Check a plot of the time series over time and look for constant mean and finite variance i.e. values appear bounded.

#plot nonstationary and stationary time series

g1 <- ggplot(df,aes(x=t,y=X1))+geom_line()+xlab("T")+ylab("X1")+ggtitle("Nonstationary")

g2 <- ggplot(df,aes(x=t,y=X3))+geom_line()+xlab("T")+ylab("X3")+ggtitle("Stationary")

grid.arrange(g1,g2)

![6  Plot Nonstationary and Stationary data](https://github.com/NollieAnalysis/Intro-to-Time-Series-Analysis-in-R/assets/163913188/452c8b79-2c04-416c-85fe-d4062996e445)

#Look at the ACF plot and see if it dies off quickly as opposed to a gradual decline.

#ACF for nonstationary and stationary time series

g1 <- ggAcf(df$X1,type="correlation") + xlab("T") + ylab("X1") + ggtitle("Nonstationary")

g2 <- ggAcf(df$X3,type="correlation") + xlab("T") + ylab("X3") + ggtitle("Stationary")

grid.arrange(g1,g2)

![6  ACF for Nonstationary and Stationary data](https://github.com/NollieAnalysis/Intro-to-Time-Series-Analysis-in-R/assets/163913188/c4856006-88c5-4852-ac46-9a975873d104)

#Perform unit root tests such as the Augmented Dickey–Fuller test.

#perform unit test; nonstationary example has large, non-significant p-value

adf.test(df$X1)

![6  Augmented Dickey-Fuller Test](https://github.com/NollieAnalysis/Intro-to-Time-Series-Analysis-in-R/assets/163913188/b32705d5-e6a5-45a9-abe3-33186df8f170)

#perform unit test; stationary example has small, significant p-value

adf.test(df$X3)

![6  Unit Test Augmented Dickey-Fuller Test](https://github.com/NollieAnalysis/Intro-to-Time-Series-Analysis-in-R/assets/163913188/7526a5cb-3174-46ac-aa20-6552e50ce09d)
