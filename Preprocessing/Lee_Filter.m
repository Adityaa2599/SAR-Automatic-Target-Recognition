function Y = Lee_Filter(R,E,sz)
%R is the Reference Image
%E is the Error or Noisy Image
%K is the Kernel or Window
%Y is the Output Image

% Y = mean(K)+W*(C-mean(K);
% W = variance(K)/(variance(K)+variance(R))

%Define the type
R = double(R);
E = double(E);


%Preallocate the Output Matrix
Y = zeros(size(R));
mn = round((sz-1)/2);
Tot = sz(1,1)*sz(1,2);
EImg = padarray(E,mn);

%Variance of the reference Image
Rvar = var(R(:));

Indx = floor(median(1:Tot));
for i = 1:size(R,1)
    for j = 1:size(R,2)
        K = EImg(i:i+sz(1,1)-1,j:j+sz(1,2)-1);
        varK = var(K(:));
        meanK = mean(K(:));
        W = varK./(varK+Rvar);
       
        Y(i,j) = meanK + W * (K(Indx)-meanK);
      
    end
end


end

