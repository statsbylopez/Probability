---
title: "MA 204 Ninth Lab"
author: "YOU AND YOUR PARTNER'S NAMES"
date: "Thursday, April 23, 2015"
---


## Central Limit Theorem

Now let's look into the Central Limit Theorem which states:

X~iid
as n->infinity:  P([X.bar-E(X)]/(SD(X)/sqrt(n))<c) is equivalent to P(Z<c)
Where Z~Normal(0,1)

This is a huge deal. Let's take a look at this for the mean of n Bernoulis with p=.8 for various n.

### Question 1a

For example, imagine tossing a weighted coin n times, where the probability of heads is 0.8


```r
# First let's say that n=5
n<-5

#Make a matrix of Bernoulli(.8) with 1000 rows and n columns

bern.matrix<-matrix(rbinom(1000*n, 1, .8),ncol=n)

#What does each set of 5 trials look like?

head(bern.matrix)
```

```
##      [,1] [,2] [,3] [,4] [,5]
## [1,]    1    1    1    0    1
## [2,]    0    1    1    1    1
## [3,]    1    1    1    1    1
## [4,]    0    1    0    0    1
## [5,]    0    1    1    1    0
## [6,]    0    1    0    1    0
```

```r
#now let's take the mean for each row using the apply function:

bern.means<-apply(bern.matrix, 1, mean)

hist(bern.means) 
```

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-1-1.png) 

Does the distribution of sample means of size 5 look normal?  

[INSERT ANSWER HERE]


### Question 1b


Next, let's standardize and compare to a normal distribition with mean 0, sd 1.


```r
#find the proportion of the [means -E(X)]/(SD(X)/sqrt(n))

transformed.bern.means<-(bern.means-.8)/(sqrt(.8*.2)/sqrt(n))

hist(transformed.bern.means)
```

![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2-1.png) 

```r
#Let's compare the transformed bernoulli means to a Normal(0,1)

mean(transformed.bern.means<1)  #proportion of transformed bernoulli means<1
```

```
## [1] 0.671
```

```r
pnorm(1,0,1)      #probability a normal(0,1) is <1.
```

```
## [1] 0.8413447
```

```r
mean(transformed.bern.means<(-1))  #proportion of transformed bernoulli means<-1
```

```
## [1] 0.253
```

```r
pnorm(-1,0,1)      #probability a normal(0,1) is <-1.
```

```
## [1] 0.1586553
```

How close are we to having our transformed bernoulli means be to a Normal(0,1)?

[INSERT ANSWER HERE]

### Question 1c


```r
# Now let's say that n=2000
n<-2000

#Make a matrix of Bernoulli(.8) with 1000 rows and n columns

bern.matrix<-matrix(rbinom(1000*n, 1, .8),ncol=n)

#now let's take the mean for each row using the apply function:

bern.means<-apply(bern.matrix, 1, mean)

hist(bern.means) #Does this look normal?
```

![plot of chunk unnamed-chunk-3](figure/unnamed-chunk-3-1.png) 

Does the distribution of sample means of size 2000 look normal?

[INSERT ANSWER HERE]


```r
#find the proportion of the [means -E(X)]/(SD(X)/sqrt(n))

transformed.bern.means<-(bern.means-.8)/(sqrt(.8*.2)/sqrt(n))

hist(transformed.bern.means)
```

![plot of chunk unnamed-chunk-4](figure/unnamed-chunk-4-1.png) 

```r
#Let's compare the transformed bernoulli means to a Normal(0,1)

mean(transformed.bern.means<1)  #proportion of transformed bernoulli means<1
```

```
## [1] 0.827
```

```r
pnorm(1,0,1)      #probability a normal(0,1) is <1.
```

```
## [1] 0.8413447
```

```r
mean(transformed.bern.means<(-1))  #proportion of transformed bernoulli means<1
```

```
## [1] 0.145
```

```r
pnorm(-1,0,1)      #probability a normal(0,1) is <1.
```

```
## [1] 0.1586553
```


### Question 1d

Edit the code from above to look at the transformed means of a bernoulli(.99) when the sample size is n=50



Does it look like n=50 is large enough for the central limit theorem to start working when p=.99?  Explain your reasoning:

[INSERT ANSWER HERE]


### Question 1e

Edit the code to make it look at the transformed means of a bernoulli(.45) when the sample size is 50

Does it look like n=50 is large enough for the central limit theorem to start working when p=.45?  Explain your reasoning:

[INSERT ANSWER HERE]



## Question 2

Of course, not everything in statistics and probability has to be coin tosses. Let's look at data from shootouts in the National Hockey League. 

First, a bit of background. At the end of any regular season game in which the two teams are tied, the teams play a 5-minute overtime. If no team scores in the overtime session, the game proceeds to a shootout, in which each team selects three skaters to shoot a one-on-one scoring attempt on the opposing goalie. Roughly 10 percent of all NHL games are decided in a shootout. 

Our interest lies in whether or not shootouts are random, or whether there is some inherent skill on behalf of individual players which allows them to perform at higher or lower levels. We will specifically look at goalies.

### Question 2a

The overall save rate in shootouts for NHL goalies is $67.2\%$. Let $X_1, X_2, ... X_n$ be inidividual shootout attempts for an individual goalie. 

Using the Central Limit Theorem, estimate $E[(X_1 + ...X_n)/n]$ and $Var[(X_1 + ...X_n)/n]$. 

[INSERT ANSWER HERE]

### Question 2b

New York's Henrik Lundqvist has faced 327 shootout attempts. Using the central limit theorem, what is the distribution of $(X_1 + ...X_{327})/327$? If we can be $95\%$ confident Lundqvist's sample mean will fall within two standard deviations of the overall player mean, where do we expect Lundqvist's sample mean to lie?

[INSERT ANSWER HERE]

### Question 2c

Lundqvist has stopped 245 of 327 attemps. Using your answer to part (2b), calculate the probability that a goalie finishes with a $higher$ propoprtion of saves than Lundqvist has. 

[INSERT ANSWER HERE]

### Question 2d

Repeat part (2c), except this time us a continuity correction.

[INSERT ANSWER HERE]

### Question 2e

One of the problems with looking at shootout outcomes is that some goalies have participated in several shootouts, while others have only participated in a few. We can account for this by using a funnel plot: see the code below.



```r
mu<-0.672
attempts<-8:400
se<-sqrt(mu*(1-mu)/attempts)
ul<-mu+2*se
ll<-mu-2*se
plot(0,0,xlim=c(0,400),ylim=c(0.3,1),xlab="Attempts",ylab="Save percentage")
abline(h=0.672,lwd=2)
points(attempts,ll,type="l",lty=2,col="red",lwd=2)
points(attempts,ul,type="l",lty=2,col="red",lwd=2)
```

![plot of chunk unnamed-chunk-6](figure/unnamed-chunk-6-1.png) 


Zoom in on the plot. What happens to the intervals with increased sample size?  Focus on the intervals created at 100 and 400 attempts. By what percent is error cut down when sample size is increased by a factor of 4?

[INSERT ANSWER HERE]

### Question 2f

We can look at the performance of several goalies using the `points()` command and the `text()` command. For example, here is Henrik Lundqvist's

`
points(327,0.749,pch=16,col="red"); text(327,0.749,"HL",col="red")
`

Go to the url `http://www.sportingcharts.com/stats/nhl/all-time/career-goalie-shootout-save-percentage.aspx` and insert the points for five players of your liking (minimum 10 shootout attempts).

Where do most of them fall? Do you believe that goalie performance in shootouts is truly random?

## Question 3

Random walks are fundamental models in numerous fields. A particle starts at the origin on the integer number line.  At each step, the particle moves left or right with probability 1/2. Find the expectation and standard deviation of the distance of the walk from the origin after $n$ steps. 


```r
simlist<-NULL
for (i in 1:5000){
  rw<-sample(c(-1,1),10000,replace=T)
  simlist[i]<-abs(tail(cumsum(rw),1))  }
mean(simlist)
```

```
## [1] 80.4084
```

```r
sd(simlist)
```

```
## [1] 60.15699
```

### Question 3a

What is the mean and standard deviation of the average distance from the origin using a sample size of 10,000?

### Question 3b

We can plot a series of random walks by repeating the code below (Hint: repeat the `rw` and `lines` commands, and not the `plot` command)


```r
steps<-10000
rw<-sample(c(-1,1),steps,replace=T)
plot(c(1,1),type="n",xlim=c(0,steps),ylim=c(-200,200),xlab="",ylab="Position")
lines(cumsum(rw),type="l")
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8-1.png) 

$Note$: `returns` the cumulative sum of all elements in an argument. Try `cumsum(1:10)` for example.


### Question 3c (bonus)

Let $S_n = X_1 + ... X_n$ be the position of the walk after the $n^{th}$ move. Find $E[S_n]$ and $Var[S_n]$ (Hint: Start by considering $E[X_1]$ and $Var[X_1]$. No coding needed.)

