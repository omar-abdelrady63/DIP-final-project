function difference_of_guassian(hObject,eventdata, handles){

      [fileName, path] = uigetfile({ '*jpg;*png;*jpeg;*gif;' }, 'select an image')
      if fileName ~=0
            img = imread(fullfile(path, fileName));
      else 
            disp('User Cancelled');
       
      grayed = rgb2gray(img);

      sigma1 = 1;
      sigma2 = 3;
      kernalSize = [5,5];

      gaussian1 = fspechial('Gaussian', kernalSize, sigma1);
      gaussian2 = fspechial('Gaussian', kernalSize, sigma2);

      dog_kernal = gaussian1 - gaussian2;
      dogFilteredImage = conv2(double(grayed), dogKernel, 'same');
}
