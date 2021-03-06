function image = gaussianFilter(image, sig)

  MINUS_TWO_PI_SQUARED = - 2 * pi ^ 2;

  ftImage = fft2(image);

  [M, N, n_channel] = size(ftImage);

  Nr = ifftshift((-fix(M/2):ceil(M/2) - 1));
  Nc = ifftshift((-fix(N/2):ceil(N/2) - 1));

%   Nr=Nr-halfRow;
%   Nc=Nc-halfCol;
  
  [Nc, Nr] = meshgrid(Nc, Nr);

ftImage = ftImage .* repmat( exp( MINUS_TWO_PI_SQUARED * sig * sig * ((Nr/M) .^ 2 + (Nc/N) .^ 2)), [1, 1, n_channel]);
 image = ifft2(ftImage);

end
