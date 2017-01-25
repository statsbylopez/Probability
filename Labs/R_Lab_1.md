# MS 204 First Lab
YOUR NAME HERE  

This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.

First, open the RStudio program on your computer.  

R Markdown simultaneously stores your commands, executes your commands, and generates an output file automatically, we will use R Markdown files to store our code and answers for Lab and Homework assignments.
    
Open a new R Markdown file (File / New File / R Markdown...).  Set the output to HTML mode, and click "Knit HTML" at the top (or Command+Shift+K on Mac).  This should produce a web page with the knitting procedure executing your code blocks.  You can edit this new file to produce homeworks (if you want to use RStudio) or final versions of your lab.

**It may be helpful to use the Lab01.Rmd file on Blackboard as a template for your submission**.  Feel free to do so.  

Notice how the text you write in the .Rmd file shows up in the output file each time you click "Knit HTML".  

***General instructions for labs***: 

+  Open the R Markdown file (.Rmd) from the course Github page
+  Change the heading to include your author name
+  Save the R Markdown file (named as:  [MikeID]-[Lab01].Rmd -- e.g. "mlopez-Lab01.Rmd") to somewhere where you'll be able to access it later (zip drive, My Documents, Dropbox, etc)
+  Your file should contain the code/commands to answer each question in its own code block, which will also produce plots that will be automatically embedded in the output file
+  Each answer must be supported by written statements (unless otherwise specified) as well as any code used

#### R as a calculator

You can also use R as a calculator:

```r
1+1
```

```
## [1] 2
```

```r
5^2
```

```
## [1] 25
```

```r
487/34
```

```
## [1] 14.32353
```



There are several different tabs that you see in RStudio.  Here are a few that you will encounter (though there are more!)
1.  The Console is where all of your commands and numeric results are displayed.  If you have an error, the words will appear in red in the Console.
2.  The History Tab keeps track of all of the commands you have entered into the console
3.  The Plots Tab will display your plots, which you can zoom in on, export, or go to previous plots using the arrows


R has many built in functions:

```r
pi
```

```
## [1] 3.141593
```

```r
cos(pi)
```

```
## [1] -1
```

```r
factorial(5)
```

```
## [1] 120
```

```r
exp(1)
```

```
## [1] 2.718282
```

```r
sqrt(169)
```

```
## [1] 13
```




R is case sensitive.  Run the chunk below, and then try it again with `Log` instead of `log`

```r
log(exp(7))
```

```
## [1] 7
```



#### Asking for help

As you could see from above, the `log` function has a default to be the natural log.  How can you find the log to base 2?  How can you find out what a function does?  Try the code below and see if you can answer these questions.  Then try to find the log to the base 2 of 64.


```r
?log

#ENTER YOUR COMMAND HERE
```


#### VECTORS

R makes working with vectors very easy!  The command `a:b` creates a vector of numbers from `a` to `b`.  Try entering in `1:45` in the chunk below.  Also try `-7:14`   

```r
#ENTER YOUR COMMANDS HERE
```
 
 
 
Another way to create vectors is by using the `seq(a,b,c)` command.  Try using the `seq(a,b,c)` command below filling in different numbers for a, b, and c.  Can you figure out what these arguments tell the `seq` command to do?

```r
#ENTER YOUR SEQ COMMANDS HERE
```


**Question 1** Explain how the `seq()` command works


The command `x <- c(2,3,5,7,11)` will generate a vector with the variable name `x`.  The assignment operator is `<-`. The `c` stands for concatenate.  Use this to make a vector with six elements that you name `cat`:


```r
cat<-NULL #this just makes an empty vector, DELETE 'NULL'  and INSERT YOUR COMMAND HERE
```



Now we want to add 3 more elements to the vector `cat`:


```r
cat<-c(cat, 4, 5, 6)
cat
```

```
## [1] 4 5 6
```


Elements of vectors are accessed with `[ ]`.

```r
cat[2]
```

```
## [1] 5
```

```r
cat[1:3]
```

```
## [1] 4 5 6
```

```r
cat[c(2,4)]
```

```
## [1]  5 NA
```




With numeric vectors you can add, subtract and do all the usual mathematical operations, treating the entire vector as a single object.


```r
cat
```

```
## [1] 4 5 6
```

```r
cat+1
```

```
## [1] 5 6 7
```

```r
cat+pi
```

```
## [1] 7.141593 8.141593 9.141593
```

```r
cat*3
```

```
## [1] 12 15 18
```

```r
cat^2
```

```
## [1] 16 25 36
```

```r
2^cat
```

```
## [1] 16 32 64
```

```r
dog<-cat*2

dog*cat
```

```
## [1] 32 50 72
```

```r
dog+cat
```

```
## [1] 12 15 18
```

```r
dog/cat
```

```
## [1] 2 2 2
```

#### Operations on Vectors

Notice that when we add a single number to a vector, that number gets added to each element of the vector. But when two vectors of the same length are added to each other, then corresponding elements are added together. This applies to most binary operations.

Some common operations on vectors are: (i) `sum` the elements, (ii) take the
average (`mean`), and (iii) find the `length`.

```r
tiger <- 1:1000
sum(tiger)
```

```
## [1] 500500
```

```r
mean(tiger)
```

```
## [1] 500.5
```

```r
length(tiger)
```

```
## [1] 1000
```


The `sample` command is one of many commands that lets you generate random numbers.  This is particularly helpful for Probability and Statistics!  The following code picks one number from the integers 1 to 10:


```r
sample(1:10,1)
```

```
## [1] 8
```


To simulate ten rolls of a six-sided die with labels {1, 2, 3, 4, 5, 6}, type

```r
roll <- sample(1:6,10,replace=TRUE)
roll
```

```
##  [1] 5 4 6 2 4 2 2 5 1 5
```

**Question 2** Repeat 10 rolls of a six-sided die as in above. Why do you keep getting different answers?

**Question 3** Enter `set.seed(100)` and repeat the 10 rolls of a six-sided die. How did your professor know you were going to get `2 2 4 1 3 3 5 3 4 2` as your output? Identify the role of the `set.seed()` command.

The command `roll == 2` creates a TRUE-FALSE vector identifying where the twos are in the original `roll` vector. We can treat this TRUE-FALSE vector as if it consists of zeros and ones. By summing that vector we count the number of twos:


```r
sum(roll==2)
```

```
## [1] 3
```


The following one-line command simulates rolling 600 dice and counting the number of twos that appear. After you type the command once, hit the up-arrow key to repeat. By repeating over and over again, you begin to get a feel for the typical behavior of the number of twos in 600 dice rolls:


```r
sum(sample(1:6,600,replace=TRUE) == 2)
```

```
## [1] 114
```

#### Plots and Graphs

To graph functions and plot data, use `plot`. This workhorse command has enormous versatility. Here is a simple plot comparing two vectors:


```r
radius <- 1:20
area <- pi*radius^2
plot(radius,area, main="Area as function of radius")
```

![](R_Lab_1_files/figure-html/plot area by radius-1.png)<!-- -->

To graph smooth functions you can also use the curve command:

```r
curve(pi*x^2,1,20,xlab="radius",ylab="area",main="Area as function of radius")
```

![](R_Lab_1_files/figure-html/plot smooth area by radius-1.png)<!-- -->

The syntax is `curve(expr,from=,to=)`, where `expr` is some expression that is a function of x.


#### Larger Chunks of Code

R can be used to do more complicated commands, and run several commands of code.  In the block of code below, we simulate flipping 1000 coins and plot the running proportion of heads from one to 1000. Let zero represent tails and one represent heads. A 1000-element coin flip vector of zeros and ones is stored in the variable `coinflips`. The `cumsum` command generates a cumulative sum and stores the resulting vector in heads. The kth element of `heads` is equal to the number of ones in the first k positions of `coinflips`, that is, the number of heads in the first k coin flips. Then `prop` stores the proportion of heads in the first k coin flips. Finally, the running proportions are plotted. 

**Question 4** Describe the behavior of the proportion of heads as you increase the number of coin tosses


```r
# Coin flips
n <- 1000 # Number of coin flips
coinflips <- sample(0:1,n,replace=TRUE)
heads <- cumsum(coinflips)
prop <- heads/(1:n)
plot(1:n,prop,type="l",xlab="Number of coin flips",
ylab="Running average", ylim = c(0, 1), 
main="Proportion of heads in 1000 coin flips")
abline(h=0.5)
```

![](R_Lab_1_files/figure-html/1000 coin flips-1.png)<!-- -->


