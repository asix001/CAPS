function dp=CAPS_06_B9TB1710_assn5(t,p); #p=[v,x]
  c=2;
  k=3;
  m=1;
  dp=[(-c*p(1)-k*p(2))/m, p(1)];
endfunction

#[T, result]= ode45(@CAPS_06_B9TB1710_assn5,[0,2.0],[0,1])
#plot(T,result(:,2))