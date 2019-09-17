%Project Description: Using Arduino and RGB Led for different colors based
%on user inputs
%Date: 5/03/2018

loop= 'y';  %the input to ask the user for continuation of the program


while(loop=='y'  || loop=='Y' ) %while loop to continue program
    fprintf('Enter the RGB values as follows:\n\n\t1st Number=Red Value\n\t2nd Number=Green Value\n\t3rd Number=Blue Value\n\n');
    
    
    for i=1:3
        check=1;
        while(check)
            color_input(i)=input(['Enter number ', num2str(i), ' between 0 and 255: ']);
            x=color_input(i);
            if((x>=0)&&(x<=255))
                check=0;
            else
                check=1;
                fprintf('\tINVALID INPUT! PLEASE TRY AGAIN!\n\n');
            end
        end
    end
    fprintf('\nYou entered the following values: \n');
    disp(['Red Value: ', num2str(color_input(1))]);
    disp(['Green Value: ', num2str(color_input(2))]);
    disp(['Blue Value: ', num2str(color_input(3))]);
    
    ratio=5/255;
    for j=1:3
        color_output(j)=color_input(j)*ratio;
    end
    
    writePWMVoltage(a, 'D6', color_output(1));
    writePWMVoltage(a, 'D5', color_output(2));
    writePWMVoltage(a, 'D3', color_output(3));
    
    %prompts user to type 'y/Y' or something else to continue or quit programrespectively
    loop=input('Do you want to continue? (y/Y to continue; any other quits the program) ' ,  's');
    clc;
end
