
wheel<-(-1:36)
sample(wheel,1)
winners<-c(-1)   #Type whatever numbers that you'll win on, for example c(-1,0) or c(33, 34, 35, 36)
win<-35             #This is the amount you win with a succesful roll
loss<--1           #This is the amount you lose with an unsuccessful roll

simlist<-NULL
for (i in 1:5000){
  roulette<-sample(wheel,10000,replace=T)
  rw<-win*roulette%in%winners+loss*(!roulette%in%winners)
  simlist[i]<-tail(cumsum(rw),1)  }
mean(simlist)
sd(simlist)
hist(simlist)

steps<-10000
roulette<-sample(wheel,10000,replace=T)
rw<-win*roulette%in%winners+loss*(!roulette%in%winners)
plot(c(1,1),type="n",xlim=c(0,steps),ylim=c(-2000,2000),xlab="",ylab="Position")
for (i in 1:100){
roulette<-sample(wheel,10000,replace=T)
rw<-win*roulette%in%winners+loss*(!roulette%in%winners)
lines(cumsum(rw),type="l")
print (i)}

