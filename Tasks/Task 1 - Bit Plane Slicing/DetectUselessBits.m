function BIs = DetectUselessBits (Img, Per)
  Per /= 100;
  % Change image to gray scale
  if size(Img, 3) == 3
    Img = rgb2gray(Img);
  end
  % Extract the image's dimensions
  [H, W] = size(Img);
  % Assume that each pixel had only 8 bits
  bits = 8;
  freq = zeros(1, bits);
  andingNum = 1;
  for plane = 1:bits
    % [1] Matrix containing the anding value
    mat = ones(H, W) * andingNum;
    % [2] Calculating the frequency of the current bitplane
    freq(1, plane) = length(nonzeros(bitand(Img, mat)));
    % [3] Shifting left once to get the next plane
    andingNum = bitshift(andingNum, 1);
  endfor
  % Extract the indicies that don't satisfy the percentage
  count = 0;
  tmp = zeros(1, bits);
  for i = 1:bits
    percentageBit = freq(1, i) / (H * W);
    if percentageBit < Per
      count += 1;
      tmp(1, count) = i;
    end
  endfor
  % Store the result  
  BIs = zeros(1, count);
  for i = 1:count
    BIs(1, i) = tmp(1, i);
  endfor
endfunction
