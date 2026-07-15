% Prog_01d.m: Arrays and Tensors.
% IMPORTANT: These commands should be run in the Command Window. 
I=uint8([10 20 30 40 50; 60 70 80 90 100; 255 40 30 20 10]);
I3DT(:,:,1)=I;
size(I3DT,1) % Gives 3, as there are 3 rows.
size(I3DT,2) % Gives 5, as there are 5 columns.
size(I3DT,3) % Gives 1, as I3DT is a rank 3 tensor.
% Create a rank 4 tensor for a color image.
img=uint16(zeros(2,3,3,1));
img(:,:,1)=uint16([10000 12000 14000; 50000 40000 30000]); % Red.
img(:,:,2)=uint16([5000 6000 7000; 8000 9000 10000]); % Green.
img(:,:,3)=uint16([60000 50000 40000; 10000 20000 30000]); % Blue.
img(2,3,3) % Gives uint16 30000.
size(img,1) % Gives 2, the number of rows.
size(img,2) % Gives 3, the number of columns.
size(img,3) % Gives 3, the number of color channels.
size(img,4) % Gives 1, as img is a rank 4 tensor.
% Create a rank-5 tensor for a color video dataset.
videoT=uint8(zeros(4,5,3,3,1));
% First frame.
videoT(:,:,1,1,1)=255 % Red channel.
videoT(:,:,2,1,1)=0 % Green channel.
videoT(:,:,3,1,1)=0 % Blue channel.
% Second frame.
videoT(:,:,1,2,1)=0 % Red channel.
videoT(:,:,2,2,1)=255 % Green channel.
videoT(:,:,3,2,1)=0 % Blue channel.
% Third frame.
videoT(:,:,1,3,1)=0 % Red channel.
videoT(:,:,2,3,1)=0 % Green channel.
videoT(:,:,3,3,1)=255 % Blue channel.
% End Prog_01d.m.