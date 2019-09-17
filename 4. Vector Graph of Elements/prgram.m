%ECE-1304-002 Spring 2018
%Name: G. Shilpakar
%Project #: 4
%Project Description: Matlab program which generates a vector based on user
%input, sorts it and presents the frequency of the elements along with the
%histogram
%Date: 3/22/2018

clc; clear;
loop= 'y';  %the input to ask the user for continuation of the program

while(loop=='y'  || loop=='Y' ) %while loop to continue program
    clear all;
s=1;
while(s==1)
    SIZE=input('Enter the desired size for your vector between (between 50 and 200): '); %receives the input from the user for the number of integers in the array
    if((SIZE<=200)&&(SIZE>=50))
        s=0;
        disp(['You entered: ', num2str(SIZE)]);
        disp(' ');
    else
        s=1;
        disp('The number you entered in not within the range. Please try again.');
        disp(' ');
    end
end

Xmin=0;
Xmax=10;
for i=1:SIZE; %the loop generates the random numbers and stores in array 'integers'
    temp_rand=Xmin+rand()*(Xmax-Xmin);
    integers(i)=fix(temp_rand);
end

%displays the unsorted array 20 elemets per column
disp('UNSORTED ARRAY: ');
disp(' ');
for i=1:SIZE
 fprintf(1, '%4.0f',integers(i));
 if(rem(i,20)==0)
     fprintf('\n')
end
end
disp(' ');
disp(' ');

%sorts the original array in increasing order and prints
N=length(integers);
for m=1:N
for k=2:N
    if(integers(k-1)>integers(k))
        z=integers(k-1);
        integers(k-1)=integers(k);
        integers(k)=z;
    end
end
end

%displays 20 elements per column
disp('SORTED ARRAY: ');
disp(' ');
for i=1:SIZE
 fprintf(1, '%4.0f',integers(i));
 if(rem(i,20)==0)
     fprintf('\n')
end
end
disp(' ');
disp(' ');

%attains the frequency of the elements in the array
for i=0:9
    iter=0;
    for x=1:SIZE
        if(integers(x)==i) %compares the element to the numbers from 0 and 9 and adds the frequency to iter
            iter=iter+1;
            a='*';
        end
    end
    frequency(i+1)=iter;
end

%displays table for the value, frequency and histogram
fprintf('Value\tFrequency\tHistogram\n');
for n=0:9
   f=frequency(n+1);

   fprintf('%2.0f\t %8.0f\t', [n,f]);
   fprintf('\t');
   
   for i=1:f
      fprintf('*');
   end
   disp(' ');
end

disp('  ');
%prompts user to type 'y/Y' or something else to continue or quit programrespectively
loop=input('Do you want to continue? (y/Y to continue; any other quits the program) ' ,  's');
clc; 
end
    



