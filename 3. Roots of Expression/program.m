%Project Description: Matlab program that finds numerically the root the
%expression in the interval [0,5]
%Date: 03/01/2018

clc; clear;
loop= 'y';  %the input to ask the user for continuation of the program

while(loop=='y'  || loop=='Y' ) %while loop to continue program
    clear all;
    
%Prompt the user to enter a positive integer  number 'n' and validates it
loop=1;
while(loop ==1)
    n=input('Enter an integer between 2 and 15: ');
    if((n>=2&&n<=15)&&(n==fix(n)))
        loop=0;
        disp(['You entered ', num2str(n), '!']);
    else
        loop=1;
        disp('Your input is invalid! Please try again.');
    end
end

XL=0;
XR=5;
x=linspace(XL,XR,500); %defines x-axis from 0 to 5 with 500 intervals
y=fox(x); %function call for the given expression

f=@(x) sqrt(log(x.^3+1))-atan(exp(3*x.^2)/(x.^4+3));
root_function= fzero(f, [XL,XR]); %calculates the root of the expression by fzero function

hold on;
grid on;

precision=10^(-n); %precision for the calculated root as per the user input
num_bi=0; %counter to find the number of iterations

%loop to find root of expression through bisection method
new_loop=1;
while(new_loop==1)
    XM=(XL+XR)/2;
    if (fox(XM)==0)
        num_bi=num_bi+1;
        root_bi=XM;
        new_loop=0;    
    elseif (abs(fox(XM))<precision)
        num_bi=num_bi+1;
        root_bi=XM;
        new_loop=0;        
    elseif ((fox(XL)*fox(XM))<0)
        XR=XM;
        num_bi=num_bi+1;
    else
        XL=XM;
        num_bi=num_bi+1;        
    end
end

disp(['Number of Bisections= ' , num2str(num_bi)]);
disp(['Root from Bisection Method=', num2str(root_bi,8)]);
disp(['Root from fzero function= ', num2str(root_function,8)]);
disp(' ');

%plots the graph of the difference of the given expression
plot(x, y, 'color', 'b');
set(gca,'FontSize',12);
title('Roots of a function');
xlabel('x-axis', 'color', 'b');
ylabel('y-axis', 'color', 'b');

%displays necessary information about roots
txt1=(['Number of Bisections= ' , num2str(num_bi)]);
txt2={ ['Root from Bisection Method= ', num2str(root_bi)], ['Root from fzero function= ', num2str(root_function)] };

text(0.6, 0.8, txt1, 'fontsize', 11);
text([0.6, 0.6], [0.6, 0.4], txt2, 'fontsize', 11);
text(root_function, 0, '\leftarrow Root');

%prompts user to type 'y/Y' or something else to continue or quit programrespectively
loop=input('Do you want to continue? (y/Y to continue; any other quits the program) ' ,  's');
clc; 
disp('  ');
end
