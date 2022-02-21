A=1;
B=7;
C=1;
D=0;

#range of x:
x=0:0.01:5;

#my function y=f(x)
y=10*sin(A*x).^2.*exp(-B*x/2) + 0.01*(C+D)*x-0.3;
#after correcting my mistakes, roots are ind: (0.2,0.3), and  (0.8,0.9)
y0=zeros(1,length(x));
plot(x,y,x,y0)

fsolve(@(x)10*sin(A*x).^2.*exp(-B*x/2) + 0.01*(C+D)*x-0.3,0.2)
fsolve(@(x)10*sin(A*x).^2.*exp(-B*x/2) + 0.01*(C+D)*x-0.3,0.8)