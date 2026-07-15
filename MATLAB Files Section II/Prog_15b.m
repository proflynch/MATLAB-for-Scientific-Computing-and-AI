% Prog_15b.m: Counting colored pixels.
% Loading image files. Use the imread command.
% The image raccoon.png is stored in an array named Image1.
Image1=imread('raccoon.png');
% To see the properties of an image use the whos command.
whos Image1 % Has dimensions 768 by 1024 by 3 and is of class uint8
% Use the imtool command to work with the image.
imageViewer(Image1)
figure
threshold=150;
P=imread('raccoon.png');
WhiteP=zeros(768,1024);
for i=1:1024
    for j=1:768
        if P(j,i,1)>threshold && P(j,i,2)>threshold...
                && P(j,i,3)>threshold
            WhiteP(j,i)=1;
        else WhiteP(j,i)=0;
        end
    end
end
Num_White_Pixels=sum(sum(WhiteP))
imshow(WhiteP);
% End Prog_15b.m.