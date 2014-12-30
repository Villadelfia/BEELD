function [ out ] = denoisesf(img, rx, ry, sx, sy, mask)
    function [ out ] = hpf(img)
        F = fft2(img);
        
        G = zeros(size(F));
        xr = floor(size(F,1)/2);
        yr = floor(size(F,2)/2);
        
        for i = [1:size(F,1)]
            for j = [1:size(F,2)]
                G(i,j) = 1-exp(-((i-xr)/xr)^2 - ((j-yr)/yr)^2);
            end
        end

        out = ifft2(F.*G);
    end

    r = img(rx, ry);
    s = img(sx, sy);
    
    rh = hpf(r);
    rl = r - rh;
    
    R = fft2(rh);
    S = fft2(s);
    
    rsize = size(R);
    
    Ms = zeros(rsize);
    
    for u = 1:rsize(1)
        for v = 1:rsize(2)
            Ms(u,v) = min(abs(R(u,v)), abs(S(u,v)));
        end
    end
    
    T = Ms.*exp(1i*angle(R));
    t = ifft2(T);
    t = t.*(1-double(mask(rx,ry) > 0.5)) + ...
            img(rx,ry).*double(mask(rx,ry) > 0.5);
    t = t + rl;
    t = real(t);
    t = min(t, 1.0);
    t = max(t, 0.0);
    
    out = zeros(size(img));
    out(rx, ry) = t;
    
    out = img;
    out(rx, ry) = t.*(1-mask(rx,ry)) + img(rx,ry).*mask(rx,ry);
end