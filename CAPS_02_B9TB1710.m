#Solution_1
for i=100:999
  i1=mod(i,10);
  i2=mod(floor(i/10),10);
  i3=floor(i/100);
  x=i1^3+i2^3+i3^3;
  if x==i
    printf('%i\n',x)
  endif
endfor

#Solution2
printf('\n')
for i3=1:9
  for i2=0:9
    for i1=0:9
      i=i3*100+i2*10+i1;    
      y=i1^3+i2^3+i3^3;
      if i==y
        printf('%i\n',y)
      endif
    endfor
  endfor
endfor
