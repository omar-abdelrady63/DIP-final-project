function noisyImg = add_gaussian_noise(inputImg)
    if size(inputImg, 3) == 3
        inputImg = rgb2gray(inputImg);
    end

    mean_val = 0;    
    variance = 0.03;  

    noisyImg = imnoise(inputImg, 'gaussian', mean_val, variance);

end