joker = imread('Joker.bmp');
SobelH = Sobel('H');
SobelV = Sobel('V');
jokerSobelH = LinearFilter(joker, SobelH, 'absolute');
jokerSobelV = LinearFilter(joker, SobelV, 'absolute');
jokerMag = EdgeMagnit(joker);
jokerMean1 = LinearFilter(joker, MeanMask(13, 5), 'cutoff');
jokerMean2 = LinearFilter(joker, MeanMask(3, 11), 'cutoff');
jokerGauss = LinearFilter(joker, Gauss2(4), 'cutoff');

moon = imread('Moon.bmp');
moonSharp = LinearFilter(moon, LaplacianSharp(), 'cutoff');

figure, imshow(uint8(jokerSobelH))
figure, imshow(uint8(jokerSobelV))
figure, imshow(jokerMag)
figure, imshow(jokerMean1)
figure, imshow(jokerMean2)
figure, imshow(jokerGauss)

figure, imshow(moonSharp);
