close all
clear all
clc

cam = webcam(2);
preview(cam);
in = input('Capture: ');
if(in == 1)
img = snapshot(cam);   
saveimage(img);
end
