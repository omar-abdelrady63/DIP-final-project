function filteredImg = remove_noise(inputImg)

    if size(inputImg,3) == 3
        inputImg = rgb2gray(inputImg);
    end

    filteredImg = medfilt2(inputImg);

end
