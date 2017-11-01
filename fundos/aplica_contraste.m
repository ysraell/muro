clear all
close all
clc

Imgs = dir('*.jpg');

T = max(size(Imgs));

for i=1:T
    h= fspecial('gaussian',[30 30],5);
    img = rgb2gray(imread(Imgs(i).name));
    imgc = contraste(img); 
    
%     subplot(1,2,1)
%     colormap(gray)
%     imagesc(img)
%     subplot(1,2,2)
%     colormap(gray)
%     imagesc(imgc)
%     pause
    str = Imgs(i).name;
    imwrite(imgc,[str(1:end-3) 'png'])
    disp([i T])
end