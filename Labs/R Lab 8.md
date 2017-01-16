---
title: "MAT 204 Eighth Lab"
date: "Thurs, April 9, 2015"
output: pdf_document
fontsize: 2em
---

## Conditional Probability

### Q1

Player 1 picks a random number $X$ uniformly distributed on (0,1). If player 1 picks $x$, he or she shows it to player 2 who picks a number $Y$ uniformly distributed between (0,$x$). Reminder: you can sample 1 number from a uniform distribution between $a$ and $b$ using `runif(1,a,b)`

First, make a list of 25 x's here:

`x<-c()`

Next, make a list of the corresponding 25 y's here:

`y<-c()`


#### Q1a

What is the mean of $Y$ in your simulations?


#### Q1a

You can find Y using the formula for conditional expectation. The formula for conditional expectation is: $E[Y] = E[E[Y|X]]$. Find the conditional expectation of $Y$ given $X$.


#### Let's just use R

Of course, R can do these simulations really fast


```r
simlist<-replicate(10000,runif(1,0,runif(1,0,1)))
mean(simlist)
```

```
## [1] 0.247902
```

```r
hist(simlist,col="blue",main="Simulated draws of Y")
```

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-1-1.png) 




### Q2


During his 4 years at college, Danny takes $N$ exams, where $N$ has a Poisson distribution with parameter $\lambda$. On each exam, he scores an 'A' with probability $p$, and we can assume that all tests are independent. Let $Z$ be the number of A's he receives. Find the correlation between $N$ and $Z$

#### Q2a

First, write the general formula for the correlation between $Z$ and $N$

#### Q2b

What is E[N]? 

What is E[Z|N]?

What is E[Z]? Use property of conditional expectation here.

What is E[NZ]? Again, use property of conditional expectation. 

#### Q2c

Calculate Cov(N,Z)

#### Q2d

What is Var[N]?

What is Var[Z|N]?

What is Var[Z]? Use property of conditional variance here

#### Q2e

Finally, solve the original question: What is Cor(N,Z)?




```r
par(mar = c(4.5,4.5, 2,2) , mfrow=c(1,1),mex = .8, cex = 1)
p <- 0.6
tlist <- rpois(10000,20)
zlist <- vector(length=10000)
for (i in 1:10000) {
zlist[i] <- rbinom(1,tlist[i],p)
}
plot(tlist,zlist,xlab="N = Number of tests ~ Poisson(20)",ylab="Z = Number of As  (p = 0.60)",main="",pch=20,cex.lab=0.8,cex.axis=0.8)
abline(v = 30)
text(12,23,labels=expression(paste("T ~ Poisson(20)")))
text(11,21,labels="p=0.60",pos=1)
text(12.5,23,"E[Z|T=30] = 30p = 18",pos=1)
text(12.5,25,expression(paste(rho," = Corr(Z,T) = ",sqrt(0.60),"= 0.775")))
```

![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2-1.png) 

```r
mean(zlist)
```

```
## [1] 12.0237
```

```r
mean(tlist)
```

```
## [1] 20.0229
```

```r
mean(zlist*tlist)
```

```
## [1] 252.8507
```

```r
cov(zlist,tlist)
```

```
## [1] 12.10257
```

```r
sqrt(var(zlist))  
```

```
## [1] 3.486568
```

```r
sqrt(var(tlist))
```

```
## [1] 4.494485
```

```r
sqrt(p) # exact correlation
```

```
## [1] 0.7745967
```

```r
cor(tlist,zlist) # simulation
```

```
## [1] 0.7723239
```
