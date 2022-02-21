#logical indexing of matrices

x1=10; #number of trials {10,100,1000,10000,100000}
Po1=zeros(1,x1); #P of orange
for i=1:10
  B=rand(1,x1) < 0.4; #1 for red box; 0 for blue box
  Frnd=rand(1,x1); #probability of choosing a fruit
  F(B==1)=Frnd(B==1)<2/8; #1 for apple; 0 for orange
  F(B==0)=Frnd(B==0) < 3/4; #1 for apple; 0 for orange
  #P of red and orange #P of blue and orange
  Po1(1,i)=sum(F==0&B==1)/x1+sum(F==0&B==0)/x1;
endfor
P1=sum(Po1)/10
v1=var(Po1)


x2=100;
Po2=zeros(1,x2);
for i=1:10
  B=rand(1,x2) < 0.4; #1 for red box; 0 for blue box
  Frnd=rand(1,x2); #probability of choosing a fruit
  F(B==1)=Frnd(B==1)<2/8; #1 for apple; 0 for orange
  F(B==0)=Frnd(B==0) < 3/4; #1 for apple; 0 for orange
  #P of red and orange #P of blue and orange
  Po2(1,i)=sum(F==0&B==1)/x2+sum(F==0&B==0)/x2;
endfor
P2=sum(Po2)/10
v2=var(Po2)


x3=1000;
Po3=zeros(1,x3);
for i=1:10
  B=rand(1,x3) < 0.4; #1 for red box; 0 for blue box
  Frnd=rand(1,x3); #probability of choosing a fruit
  F(B==1)=Frnd(B==1)<2/8; #1 for apple; 0 for orange
  F(B==0)=Frnd(B==0) < 3/4; #1 for apple; 0 for orange
  #P of red and orange #P of blue and orange
  Po3(1,i)=sum(F==0&B==1)/x3+sum(F==0&B==0)/x3;
endfor
P3=sum(Po3)/10
v3=var(Po3)


x4=10000;
Po4=zeros(1,x4);
for i=1:10
  B=rand(1,x4) < 0.4; #1 for red box; 0 for blue box
  Frnd=rand(1,x4); #probability of choosing a fruit
  F(B==1)=Frnd(B==1)<2/8; #1 for apple; 0 for orange
  F(B==0)=Frnd(B==0) < 3/4; #1 for apple; 0 for orange
  #P of red and orange #P of blue and orange
  Po4(1,i)=sum(F==0&B==1)/x4+sum(F==0&B==0)/x4;
endfor
P4=sum(Po4)/10
v4=var(Po4)

