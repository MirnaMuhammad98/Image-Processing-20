function man_img = extract_man(img)
[rows, cols, ~] = size(img);

black_back = img;
for r = 1:rows
    for c = 1:cols
        R = img(r, c, 1);
        G = img(r, c, 2);
        B = img(r, c, 3);
        if B > R && B > G && B > 85
            black_back(r, c, :) = 0;
        else
            black_back(r, c, :) = 255;
        end
    end
end
figure, imshow(black_back);

% close the man
SE = strel('square', 3);
closed_img = imclose(black_back, SE);
figure, imshow(closed_img);

% open the man 
opened_img = imopen(closed_img, SE);
figure, imshow(opened_img);
 
% remove white snow
SE = strel('disk', 1);
closed_img = imerode(closed_img, SE);
figure, imshow(closed_img);

% boundary extraction 
% SE = strel('square', 3);
% erodedImg = imerode(g_img, SE);
% boundaryImg = g_img - erodedImg;
% figure, imshow(boundaryImg);

e_img = edge(rgb2gray(closed_img), 'canny');
figure, imshow(e_img);

e_img = imdilate(e_img, ones(3, 3));
figure, imshow(e_img);

n_img = ~e_img;
[l_img, ~] = bwlabel(n_img);
rgb_img = label2rgb(l_img);
figure, imshow(rgb_img);

man_img = uint8(zeros(rows, cols, 3));
for r = 1:rows
    for c = 1:cols
        R = rgb_img(r, c, 1);
        G = rgb_img(r, c, 2);
        B = rgb_img(r, c, 3);
        if R == 255 && G == 255 && B == 0
            man_img(r, c, :) = img(r, c, :);
        end
    end
end
figure, imshow(man_img);

end

