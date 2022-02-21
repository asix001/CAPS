#loading data from Nobel_vs_choco.txt as a matrix
nobel=load("Nobel_vs_choco.txt").data(:,1)
choc=load("Nobel_vs_choco.txt").data(:,2)

#plotting the data
plot(nobel,choc,"o")
axis([0,32,0,12])
set(gca,"fontsize",14)

#approximation with Least square method
X=ones(23,2);
X(:,1)=nobel;
P1=pinv(X)*choc;
hold on
xx=0:1:32;
plot(xx,P1(1)*xx+P1(2))
