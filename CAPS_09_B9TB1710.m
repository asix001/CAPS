A=1;
B=7;
C=1;
D=0;
l=(28/(B+1))*0.7*(A+1); #number of events in 28 days on average
k=10+C+D; #number of events in 28days
Y=randp(l,1,10000);
X=Y(Y>=k);
P=length(X)/length(Y)