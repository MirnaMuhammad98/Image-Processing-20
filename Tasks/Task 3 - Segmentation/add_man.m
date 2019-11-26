function img_plus_man = add_man(img, man_img)
[rows, cols, ~] = size(man_img);
img_plus_man = img;
for r = 1:rows
    for c = 1:cols
        R = man_img(r, c, 1);
        G = man_img(r, c, 2);
        B = man_img(r, c, 3);
        if ~(R == 0 && G == 0 && B == 0)
           img_plus_man(r, c, :) = man_img(r, c, :);
        end
    end
end
figure, imshow(img_plus_man);
end

