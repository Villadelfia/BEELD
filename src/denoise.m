function [ out ] = denoise(img, rx, ry, sx, sy, mask) 
    r = img(rx, ry);
    s = img(sx, sy);
    
    R = fft2(r);
    S = fft2(s);
    
    rsize = size(R);
    
    Ms = zeros(rsize);
    
    for u = 1:rsize(1)
        for v = 1:rsize(2)
            Ms(u,v) = min(abs(R(u,v)), abs(S(u,v)));
        end
    end
    
    Ms(1,1) = R(1,1);
    
    T = Ms.*exp(i*angle(R));
    
    t = ifft2(T);
    t = real(t);
    t = min(t, 1.0);
    t = max(t, 0.0);
    
    out = img;
    out(rx, ry) = t.*(1-mask(rx,ry)) + img(rx,ry).*mask(rx,ry);

end

