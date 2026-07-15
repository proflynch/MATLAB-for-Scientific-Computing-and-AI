% Prog_09d.m: Privacy-Preserving Heatmaps.
% Step 1: Load real MATLAB image.
set(groot,'defaultAxesFontSize',20);
set(groot,'defaultTextFontSize',20);
img=imread('cameraman.tif');
img=im2double(img);
% Step 2: Controlled privacy noise (reduced distortion).
epsilon=2.5;      % Higher epsilon = weaker noise = clearer image.
noise_scale=0.3;  % Additional control over blur strength.
noise=noise_scale*(1/epsilon)*randn(size(img));
img_private=img+noise;
% Step 3: Difference map.
img_diff=abs(img-img_private);
% Step 4: Plot results.
figure('Color','w','Position',[100 100 1200 400]);
tiledlayout(1,3,'TileSpacing','compact','Padding','compact');
% Original image.
nexttile;
imagesc(img);
axis image off;
colormap(gray);
title('Original Image (Cameraman)','FontWeight','bold');
% Privacy-preserved (less blurred).
nexttile;
imagesc(img_private);
axis image off;
colormap(gray);
title('Privacy-Preserved Image (Mild Noise)','FontWeight','bold');
% Difference map
nexttile;
imagesc(img_diff);
axis image off;
colormap(parula);
title('Privacy Noise Effect','FontWeight','bold');
% Shared colorbar
cb=colorbar;
cb.Layout.Tile='east';
cb.Label.String='Intensity';
% End Prog_09d.m.