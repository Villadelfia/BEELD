function [ out ] = denoise3(img, rx, ry, sx, sy, mask) 
    red = denoise(img(:,:,1), rx, ry, sx, sy, mask);
    grn = denoise(img(:,:,2), rx, ry, sx, sy, mask);
    blu = denoise(img(:,:,3), rx, ry, sx, sy, mask);
    
    out = zeros(size(img));
    out(:,:,1) = red;
    out(:,:,2) = grn;
    out(:,:,3) = blu;
end