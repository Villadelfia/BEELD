function [ out ] = denoisesf3(img, rx, ry, sx, sy, mask) 
    red = denoisesf(img(:,:,1), rx, ry, sx, sy, mask);
    grn = denoisesf(img(:,:,2), rx, ry, sx, sy, mask);
    blu = denoisesf(img(:,:,3), rx, ry, sx, sy, mask);
    
    out = zeros(size(img));
    out(:,:,1) = red;
    out(:,:,2) = grn;
    out(:,:,3) = blu;
end