        for i= 26:35
        j = int2str(i);
        str2 = strcat(j,'.jpg');
        load(str2);
        capcha=imread(str2);
        
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
        A = [c1, co1, e1, h1, c2, co2, e2, h2, c3, co3, e3, h3, c4, co4, e4, h4,];
     
        
        str = strcat(j,'.xlsx');
        xlswrite(str, A);
        
        end