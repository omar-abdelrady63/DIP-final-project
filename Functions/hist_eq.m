function outputImage = hist_eq(inputImage)


   if size(inputImage, 3) == 3
        inputImage = rgb2gray(inputImage);
    end
    outputImage = histeq(inputImage);

end