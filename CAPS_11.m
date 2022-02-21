data=csvread("cars.csv");
%plot(data(3:408,5),data(3:408,6),"o")
#posivite covariance in this case cov(X,X)=var(X)
#correlation coefficient [-1,1]
#corr(data(3:408,5),data(3:408,6))
X=dlmread("3d_ptdata.m"," ",5,1);
plot3(X(:,1), X(:,2),X(:,3),".")
axis equal