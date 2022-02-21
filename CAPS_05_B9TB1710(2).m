#loading data from Nobel_vs_choco.txt as a matrix
nobel=load("Nobel_vs_choco.txt").data(:,1)
choc=load("Nobel_vs_choco.txt").data(:,2)

#adding imaginary kingdom CAPS
A=1;
B=7;
C=1;
D=0;

nobel(24)=10*(A+B);
choc(24)=0.5*(C+D);

#plotting the data
plot(nobel,choc,"o")
axis([0,82,0,12])
set(gca,"fontsize",14)

#approximation with Least square method
Y=ones(24,2);
Y(:,1)=nobel;
P2=pinv(Y)*choc;
hold on
xxx=0:1:82;
plot(xxx,P2(1)*xxx+P2(2))
