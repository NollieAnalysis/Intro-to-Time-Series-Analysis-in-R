#function to similate random walk
sim.random.walk <- function(seed=30,n=1000,random.mean=0,random.sd=1)
  
{data.frame("t"=1:n,"X"=cumsum(rnorm(n,random.mean,random.sd)))}

#simulate random walk

dat<-sim.random.walk()

#plot random walk

dat %>% ggplot(aes(t,X)) + geom_line() + xlab("T") + ylab("X") + ggtitle("Time Series Plot")



#ACF plot

ggAcf(dat$X,type="correlation") + ggtitle("Autocorrelation ACF Plot")



#PACF plot

ggAcf(dat$X,type="partial") + ggtitle("Partial Autocorrelation PACF Plot")



#create three time series for example

df <- sim.stationary.example(n=1000)

head(df);dim(df)



#Check a plot of the time series over time and look for constant mean and finite variance i.e. values appear bounded.

#plot nonstationary and stationary time series

g1 <- ggplot(df,aes(x=t,y=X1))+geom_line()+xlab("T")+ylab("X1")+ggtitle("Nonstationary")

g2 <- ggplot(df,aes(x=t,y=X3))+geom_line()+xlab("T")+ylab("X3")+ggtitle("Stationary")

grid.arrange(g1,g2)




#Look at the ACF plot and see if it dies off quickly as opposed to a gradual decline.

#ACF for nonstationary and stationary time series

g1 <- ggAcf(df$X1,type="correlation") + xlab("T") + ylab("X1") + ggtitle("Nonstationary")

g2 <- ggAcf(df$X3,type="correlation") + xlab("T") + ylab("X3") + ggtitle("Stationary")

grid.arrange(g1,g2)




#Perform unit root tests such as the Augmented Dickey–Fuller test.

#perform unit test; nonstationary example has large, non-significant p-value

adf.test(df$X1)





#perform unit test; stationary example has small, significant p-value

adf.test(df$X3)