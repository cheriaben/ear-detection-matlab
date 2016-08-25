function [ ] = detectImage(capcha)
        
        
        gray=rgb2gray(capcha);
        filImage = medfilt2(gray);
        
        
        imshow(filImage);
        saveimage(filImage);
        
        g1 = graycomatrix(filImage,'Offset', [0 1]);
        s1 = graycoprops(g1,{'Contrast','Correlation','Energy','Homogeneity'});
        c1 = s1.Contrast;
        co1 = s1.Correlation;
        e1 = s1.Energy;
        h1 = s1.Homogeneity;
        
        g2 = graycomatrix(filImage,'Offset', [-1 1]);
        s2 = graycoprops(g2,{'Contrast','Correlation','Energy','Homogeneity'});
        c2 = s2.Contrast;
        co2 = s2.Correlation;
        e2 = s2.Energy;
        h2 = s2.Homogeneity;
        
        g3 = graycomatrix(filImage,'Offset', [-1 0]);
        s3 = graycoprops(g3,{'Contrast','Correlation','Energy','Homogeneity'});
        c3 = s3.Contrast;
        co3 = s3.Correlation;
        e3 = s3.Energy;
        h3 = s3.Homogeneity;
        
        g4 = graycomatrix(filImage,'Offset', [-1 -1]);
        s4 = graycoprops(g4,{'Contrast','Correlation','Energy','Homogeneity'});
        c4 = s4.Contrast;
        co4 = s4.Correlation;
        e4 = s4.Energy;
        h4 = s4.Homogeneity;
        
data = xlsread('EarDataset.xlsx');

contrast1 = data(:,1);
correlation1 = data(:,2);
energy1 = data(:,3);
homogeneity1 = data(:,4);
contrast2 = data(:,5);
correlation2 = data(:,6);
energy2 = data(:,7);
homogeneity2 = data(:,8);
contrast3 = data(:,9);
correlation3 = data(:,10);
energy3 = data(:,11);
homogeneity3 = data(:,12);
contrast4 = data(:,13);
correlation4 = data(:,14);
energy4 = data(:,15);
homogeneity4 = data(:,16);
person = data(:,17);




[rc1, cc1] = size(contrast1);
[rco1, cco1] = size(correlation1);
[re1, ce1] = size(energy1);
[rh1, ch1] = size(homogeneity1);


[rc2, cc2] = size(contrast2);
[rco2, cco2] = size(correlation2);
[re2, ce2] = size(energy2);
[rh2, ch2] = size(homogeneity2);


[rc3, cc3] = size(contrast3);
[rco3, cco3] = size(correlation3);
[re3, ce3] = size(energy3);
[rh3, ch3] = size(homogeneity3);


[rc4, cc4] = size(contrast4);
[rco4, cco4] = size(correlation4);
[re4, ce4] = size(energy4);
[rh4, ch4] = size(homogeneity4);

[rp, cp] = size(person);

for i = 1:rp
    
    c1b = (c1 - contrast1(i, 1)) ^ 2;
    co1b = (co1 - correlation1(i, 1)) ^ 2;
    e1b = (e1 - energy1(i, 1)) ^ 2;
    h1b = (h1 - homogeneity1(i, 1)) ^ 2;

    c2b = (c2 - contrast2(i, 1)) ^ 2;
    co2b = (co2 - correlation2(i, 1)) ^ 2;
    e2b = (e2 - energy2(i, 1)) ^ 2;
    h2b = (h2 - homogeneity2(i, 1)) ^ 2;

    c3b = (c3 - contrast3(i, 1)) ^ 2;
    co3b = (co3 - correlation3(i, 1)) ^ 2;
    e3b = (e3 - energy3(i, 1)) ^ 2;
    h3b = (h3 - homogeneity3(i, 1)) ^ 2;

    c4b = (c4 - contrast4(i, 1)) ^ 2;
    co4b = (co4 - correlation4(i, 1)) ^ 2;
    e4b = (e4 - energy4(i, 1)) ^ 2;
    h4b = (h4 - homogeneity4(i, 1)) ^ 2;

    total(i) = sqrt((c1b + co1b + e1b + h1b + c2b + co2b + e2b + h2b + c3b + co3b + e3b + h3b + c4b + co4b + e4b + h4b));
    
    disp(total(i));
end
A = min(total);
disp('Nilai terkecil: ');
disp(A);
for j = 1:rp
    if A == total(j)
disp('Telinga milik: ');
disp(person(j,1));
    end
end
end





