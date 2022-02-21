R1=dlmread("rating1.txt"," ",5,1);
R1=R1(1:5,:);

#decomposition into R1=P1*S1
[U1,W1,V1]=svd(R1,'econ');
P1=U1(:,1:3);
S1=W1(1:3,1:3)*V1'(1:3,:);

r6=[4,2,3]; #known ratings of 6th person
X1=[S1(:,1)';S1(:,3)';S1(:,7)']';
p6=r6*inv(X1);

#complementing data of 6th person
R1(6,1)=4;
R1(6,3)=2;
R1(6,7)=3;

for i=1:20
  if i!=[1,3,7]
    R1(6,i)=p6*S1(:,i);
  endif
endfor

Ra=[4,3,2,2,3,3,3,2,3,1,2,3,2,2,3,4,3,3,3,3]; #actual data of 6th person
result1=[R1(6,:);Ra;abs(R1(6,:)-Ra)]'

estim1=[result1(2,3)',result1(4:6,3)', result1(8:20,3)'];
mean1=mean(estim1);
med1=median(estim1);

printf("Median of differences between estimations \nand actual data is %f, and mean is %f.",med1,mean1);