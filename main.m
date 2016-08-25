%Main
close all
clear all
clc

cam = webcam(1);
preview(cam);

while (1==1)
    
    choice=menu('EAR DETECTION',...
        'Capture',...
        'Exit');
    if (choice ==1)
        img = snapshot(cam);   
        detectImage(img);
    end
    if (choice == 2)
        clear all;
        clc;
        close all;
        return;
    end    
end