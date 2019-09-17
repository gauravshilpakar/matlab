%Project Description: Plot of step function
%Date: 1/25/2018

clc; clear;

%define step points
a=2;
b=4;
c=6;

%define x-axis
Xmin=-4;
Xmax=8;
Npts=10000;
x=linspace(Xmin, Xmax, Npts);

%define the step functions
ua=(x>=a);
ub=(x>=b);
uc=(x>=c);
rect1=ua-ub;
rect2=ub-uc;
triang1=(x-a).*rect1;
triang2=(c-x).*rect2;


%plot
plot(x , triang1, x , triang2);