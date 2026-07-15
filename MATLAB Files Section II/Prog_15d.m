% Prog_15d.m: Vascular architecture tracing using edge filters.
% Load retina image.
retina_source = double(imread('retina.png'));
retina_source = retina_source(:,:,1); % Convert to grayscale if it's RGB.
% Display original retina image
figure;
imshow(retina_source, []);
title('Original Retina Image');
% Convert to grayscale (if the image isn't already in grayscale)
retina = im2gray(retina_source);
% Apply multi-level Otsu thresholding.
t0 = graythresh(retina);
% Create binary mask using thresholding
mask = retina > t0;
% Apply Canny edge filter.
vessels = edge(retina, 'Canny') .* mask;
% Convert vessels to grayscale (if needed)
img_gray = vessels;
% Apply binary thresholding
t = 0.01;
binary_mask = img_gray > t;
% Remove small objects from binary mask
binary_mask = bwareaopen(binary_mask, 100);
% Display final binary mask
figure;
imshow(binary_mask, []);
% End Prog_15d.m.