%Project Description: Matlab program to sequentially turn on (turn off) 
%the LEDs as you vary the resistance of the potentiometer on arduino
%Date: 04/23/2018

time=1000;
while (time>0)
    voltage=readVoltage(a, 'A0'); %reads voltage from potentiometer connected in Analog Pin 0
    if (voltage<0.5) %turns of all LEDS if voltage is less than 0.5V
        writePWMVoltage(a, 'D3', 0);
        writePWMVoltage(a, 'D5', 0);
        writePWMVoltage(a, 'D6', 0);
        writePWMVoltage(a, 'D9', 0);
        writePWMVoltage(a, 'D10', 0);
        
    elseif ((voltage>=0.5)&&(voltage<1)) %turns on LED D3 when voltage is between 0.5V and 1V and so on
        writePWMVoltage(a, 'D3', 1);
        writePWMVoltage(a, 'D5', 0);
        writePWMVoltage(a, 'D6', 0);
        writePWMVoltage(a, 'D9', 0);
        writePWMVoltage(a, 'D10', 0);
        
    elseif ((voltage>=1)&&(voltage<2))
        writePWMVoltage(a, 'D3', 1);
        writePWMVoltage(a, 'D5', 1);
        writePWMVoltage(a, 'D6', 0);
        writePWMVoltage(a, 'D9', 0);
        writePWMVoltage(a, 'D10', 0);
        
    elseif ((voltage>=2)&&(voltage<3))
        writePWMVoltage(a, 'D3', 1);
        writePWMVoltage(a, 'D5', 1);
        writePWMVoltage(a, 'D6', 1);
        writePWMVoltage(a, 'D9', 0);
        writePWMVoltage(a, 'D10', 0);
        
    elseif ((voltage>=3)&&(voltage<4))
        writePWMVoltage(a, 'D3', 1);
        writePWMVoltage(a, 'D5', 1);
        writePWMVoltage(a, 'D6', 1);
        writePWMVoltage(a, 'D9', 1);
        writePWMVoltage(a, 'D10', 0);
    else
        writePWMVoltage(a, 'D3', 1);
        writePWMVoltage(a, 'D5', 1);
        writePWMVoltage(a, 'D6', 1);
        writePWMVoltage(a, 'D9', 1);
        writePWMVoltage(a, 'D10', 1);
    end
    time=time-1;
    pause(0.1);
end
