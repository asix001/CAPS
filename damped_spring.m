#ODE of damped spring ma+bv+kx=0

function df=damped_spring(t,f); #f=[v,x]
  b=15;
  k=200;
  m=2;
  df=[(-b*f(1)-k*f(2))/m, f(1)];
endfunction
