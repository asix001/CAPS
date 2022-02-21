function dp = deriv_fun(t,p);
  g=9.81;
  dp=[p(3),p(4),0,-g];
endfunction

#[T, result]= ode45(@deriv_fun,[0,2.0],[0,1])