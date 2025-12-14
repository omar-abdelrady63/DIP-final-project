function outputImg = dog_filter(inputImg)
    sigma1 = 2.0;
    sigma2 = 1.0;


    g1 = imgaussfilt(inputImg, sigma1);
    g2 = imgaussfilt(inputImg, sigma2);
    diffImg = double(g1) - double(g2);

    outputImg = mat2gray(diffImg);
    
end