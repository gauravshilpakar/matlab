
%Project Description: Prompt the user to enter a coefficient alpha and
%display the functions cos(x), +/- exp(-alpha*x), and cos(x)*exp(-alpha*x)
%Date: 1/25/2018

clc; clear;

alpha=input('Enter the alpha coefficient (>0): '); %Asks the user 

%Define x-axis and number of points
Xmin=0;
Xmax=40;
Npts=1000;
x=linspace(Xmin, Xmax, Npts);

%Define the functions
y1=cos(x);
y2=exp(-alpha*x);
y3=-exp(-alpha*x);
y4=y1.*y2;
plot(x, y1, x, y2, x, y3, x, y4);
