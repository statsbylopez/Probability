---
title: "MAT 204 Lab: Geometric and Negative binomial RV's"
author: "YOU AND YOUR PARTNER'S NAMES"
date: "Tuesday, March 10, 2015"
---

Today our lab will deal with Geometric and Negative Binomial Random variables.

###Geometric! 

#### Simulating a geometic random variable.  

Let's say we want to simulate a singe random variable: X~Geometric(.3)


```r
my.list<-c(rep(1, 3), rep(0,7))
n<-1000
sampled<-sample(my.list, n, replace=TRUE )  #sample a lot with replacement
index<-1:n  
index.success<-index[sampled==1]
index.success[1]  # will return the first success, if there is a success
```

```
## [1] 4
```

Go step by step through the above code. What is each step doing?

That was pretty complicated!  Fortunately, we don't have to do this always... Instead we can use some built in functions:

Take a moment and try different values in the functions below:


```r
dgeom(4, .2)    #returns the probability of being equal to a particular value for a Geometric random variable
```

```
## [1] 0.08192
```

```r
pgeom(4, .2)    #returns the probability of being <= to a particular value for a Geometric random variable
```

```
## [1] 0.67232
```

```r
rgeom(4, .2)    #generates one or more Geometric random variables
```

```
## [1] 0 1 7 6
```

What are the each of the above calculations doing?

####Negative Binomial! 

#### Simulating a negative binomial variable.  

Here's a way of doing the negative binomial distribution by hand: X~NegativeBinomial(2, .3)


```r
my.list<-c(rep(1, 3), rep(0,7))
n<-1000
sampled<-sample(my.list, n, replace=TRUE )  #sample a lot with replacement
index<-1:n  
index.success<-index[sampled==1]
index.success[2]  # will return the index second success
```

```
## [1] 10
```

####It's not worth using R's functions for the negative binomial distribution, as they are too annoying

###Exercise 1

Giles is thinking about shaving his beard.  Each day he has a 0.15 chance of shaving his beard.  Assume independence.  What is the probability that Giles will shave his beard on the 10th day?  Before the 8th day? After the 14th day? 

Calculate these by hand, and then use R to verify your results.

[INSERT CODE HERE]


###Exercise 2
Here's an update on Giles' beard progress.  Giles has gone 40 days without shaving his beard, and now he has a pretty sizable beard.  Given that Giles has not shaved his beard in the first 40 days, what is the proability that Giles will shave his beard on the 50th day?  How does this answer compare to 5A?

[INSERT CODE HERE]
[INSERT RESPONSE HERE]



###Exercise 3
Happy Meals at McDonalds contain Frozen characters: 6 total, one each of Elsa, Anna, Sven, Kristoff, Olaf, and Hans. Note: you can store characters using the command `frozen <- c("Elsa","Anna",...)' in R. 

####Exercise 3a 

Use R to simulate the average number of Happy Meals until a person has received the Elsa character. Does this match your expectation? 

####Exercise 3b

What is the variance of the average number of Happy Meals until a person has received the frozen character. Does this match your expectation? 

####Exercise 3c
Next, use R to simulate the average number of Happy Meals until a person has received each of the characters from Frozen. 

[INSERT CODE HERE]
[INSERT RESPONSE HERE]








