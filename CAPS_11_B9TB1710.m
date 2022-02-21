load_faces #400 faces, 10304 information
CX=X-ones(400,1)*mean(X);
[U,W,V]=svds(CX,20);
w=0;
for i=1:20
  w(i)=W(i,i);
endfor

plot(w.^2,"o"); #plotting eigenvalues
set(gca,"fontsize",14);
figure

#eigenvectors
for j=1:20
  svec=V(:,j);
  imshow(reshape(svec,[112,92]),[min(svec),max(svec)]);
  if j<20
    figure
   endif
endfor
