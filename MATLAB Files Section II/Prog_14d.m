% Prog_14d.m: Box Counting a Binary Image (Sierpinski).
img=imread('Sierpinski.png');
% Detect red pixels.
R=img(:,:,1);
G=img(:,:,2);
B=img(:,:,3);
binary=(R>150)&(G<100)&(B<100);
% Automatically crop.
[row,col]=find(binary);
rmin=min(row);rmax=max(row);cmin=min(col);cmax=max(col);
imgCrop=binary(rmin:rmax,cmin:cmax);
targetDim=1024;            
fillFraction=0.95; % You may need to play with this number.
[rows,cols]=size(imgCrop);
scale=fillFraction*targetDim/max(rows,cols);
imgResize=imresize(imgCrop,scale,'nearest');
% Pad to centre.
[rows,cols]=size(imgResize);
padTop=floor((targetDim-rows)/2);
padBottom=ceil((targetDim-rows)/2);
padLeft=floor((targetDim-cols)/2);
padRight=ceil((targetDim-cols)/2);
imgPad=padarray(imgResize,[padTop padLeft],0,'pre');
imgPad=padarray(imgPad,[padBottom padRight],0,'post');
figure;
imshow(imgPad);
title('Binary Image Used for Box Counting');
% Box counting.
N=size(imgPad,1);
boxSizes=2.^(0:log2(N));
boxSizes=fliplr(boxSizes);
counts=zeros(size(boxSizes));
for k=1:length(boxSizes)
    s=boxSizes(k);
    nBox=N/s;
    count=0;
    for i=1:nBox
        for j=1:nBox
            block=imgPad((i-1)*s+1:i*s,(j-1)*s+1:j*s);
            if any(block(:))
                count=count+1;
            end

        end
    end
    counts(k)=count;
end
% Remove zero counts.
idx=counts>0;
boxSizes=boxSizes(idx);
counts=counts(idx);
% Linear fit.
x=log(1./boxSizes);
y=log(counts);
p=polyfit(x,y,1);
D=p(1);
yfit=polyval(p,x);
% Plot.
figure;
plot(x,y,'ko','MarkerFaceColor','k','MarkerSize',7);
hold on
plot(x,yfit,'r','LineWidth',2);
grid on
xlabel('log(1/\epsilon)')
ylabel('log(N(\epsilon))')
title(sprintf('Box Counting Dimension = %.4f',D))
legend('Data','Linear Fit','Location','northwest')
set(gca,'FontSize',15)
fprintf('\nEstimated Box Counting Dimension = %.5f\n',D);
% End Prog_14d.m.