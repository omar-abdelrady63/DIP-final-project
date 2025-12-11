function outputImg = add_sp_noise(inputImg)
    
    
    
    noiseDensity = 0.05; 
    
    
    outputImg = imnoise(inputImg, 'salt & pepper', noiseDensity);
    
end