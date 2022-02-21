printf('Random numbers:\n')
r=randi([-1000,1000],3,3)*0.0001

A = [0.2,-0.1,1.0;3.0,0.1,-1.0;1.0,-2.0,-0.5]+r
printf('\nPoint%i coordinates: x=%f, y=%f, z=%f\n',[1,A(1,:)],[2,A(2,:)],[3,A(3,:)])

X=A\[1;1;1];
a=A(1,1);
b=A(1,2);
c=A(1,3);

printf('\nEquation of the plane is: (%f)x+(%f)y +(%f)z=1\n', a,b,c)