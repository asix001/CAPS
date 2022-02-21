#Monte Carlo method
% box_fruit.m
num_bf = zeros(2,2);#how many times you picked up each situation
#1,1-red,apple;1,2-blue,apple;2,1-red,orange;2,2-blue,orange
for i=1:10000
  if rand(1,1)<0.4 % red box (40%)
    if rand(1,1) < 2.0/8; %apple
      num_bf(1,1) +=1;
    else % orange
      num_bf(2,1)+=1;
    endif
  else % blue box
    if rand(1,1) < 3.0/4;%apple
      num_bf(1,2) +=1;
    else % orange
      num_bf(2,2) +=1;
    endif
  endif
endfor


#logical indexing of matrices
B=rand(1,10000) < 0.4; % 1 for red box; 0 for blue box
Frnd=rand(1,10000);
F(B==1)=Frnd(B==1)<2/8; % 1 for apple; 0 for orange
F(B==0)=Frnd(B==0) < 3/4; % 1 for apple; 0 for orange
ro=sum(F==1&B==1)/10000;
bo=sum(F==1&B==0)/10000;
ra=sum(F==0&B==1)/10000;
ba=sum(F==0&B==0)/10000;