img = imread('jump.jpg');
man_img = extract_man(img);

img = imread('jump2.jpg');
img_plus_man = add_man(img, man_img);