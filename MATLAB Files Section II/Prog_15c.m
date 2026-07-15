% Prog_15c.m: Statistical Analysis on Microbes.
% Read image
microbes_img=imread("Microbes.png");
% Figure 1: Original image.
figure(1)
imshow(microbes_img, [])
title("Original Image")
[width,height,~]=size(microbes_img);
% Figure 2: Binary image.
binary=zeros(width, height);
for i=1:width
    for j=1:height
        if microbes_img(i,j,1)>80
            binary(i,j)=1;
        end
    end
end
figure(2)
imshow(binary)
title("Binary Image")
% Label connected components.
blobs=binary>0.5;
[labels,no_objects]=bwlabel(blobs);
stats=regionprops(labels);
% Figure 3: Centroids of clusters.
figure(3)
imshow(microbes_img, [])
hold on
centroids=zeros(length(stats),2);
for i=1:length(stats)
    my_centroid=stats(i).Centroid;
    centroids(i,:)=my_centroid;
    plot(my_centroid(1),my_centroid(2),'r+')
end
title("Centroids of Microbe Clusters")
hold off
% Figure 4: Histogram of cluster areas.
labeled_areas = zeros(no_objects,1);
for i = 1:no_objects
    labeled_areas(i) = stats(i).Area;
end
% disp(labeled_areas)
figure(4)
histogram(labeled_areas, no_objects)
xlabel("Area", "FontSize", 15)
ylabel("Number of clusters", "FontSize", 15)
set(gca,'FontSize',15)
% Figure 5: Canny edge detector.
edges=edge(binary,'canny');
figure(5)
imshow(edges)
title("Canny Edge Detector")
% End Prog_15c.m.