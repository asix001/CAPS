R2=dlmread("rating2.txt"," ",5,1);
R2=R2(1:15,:);

#decomposition into R2=P2*S2
[U2,W2,V2]=svd(R2, 'econ');
P2=U2(:,1:3);
S2=W2(1:3,1:3)*V2'(1:3,:);

r16=[4,2,3]; #known ratings of 16th person
X2=[S2(:,1)';S2(:,3)';S2(:,7)']';
p16=r16*inv(X2);

#complementing data of 16th person into R2
R2(16,1)=4;
R2(16,3)=2;
R2(16,7)=3;

for i=1:20
  if i!=[1,3,7]
    R2(16,i)=p16*S2(:,i);
  endif
endfor

Ra=[4,3,2,2,3,3,3,2,3,1,2,3,2,2,3,4,3,3,3,3];
result2=[R2(16,:);Ra;abs(R2(16,:)-Ra)]'

estim2=[result2(2,3)',result2(4:6,3)', result2(8:20,3)'];
mean2=mean(estim2);
med2=median(estim2);

printf("Median of differences between estimations \nand actual data is %f, and mean is %f.",med2,mean2);