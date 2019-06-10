% This script shows how the finger region and edges can be detected.

img1 = im2double(imread('Published_database_FV-USM_Dec2013/1st_session/raw_data/001_1/01.jpg')); % Read image
img1 = imresize(img1, 0.5);              % Downscale image
for i=1:size(img1,1)
    for j=1:size(img1,2)
        if img1(i,j)<0.1
            img1(i,j)=0;
        end
    end
end
img=img1;
% img2 = im2double(imread('finger.png')); % Read image
% img2 = imresize(img2, 0.5);              % Downscale image
mask_height=4; % Height of the mask
mask_width=20; % Width of the mask
[fvr, edges] = lee_region(img,mask_height,mask_width);

% Create a nice image for showing the edges
edge_img = zeros(size(img));
edge_img(edges(1,:) + size(img,1)*[0:size(img,2)-1]) = 1;
edge_img(edges(2,:) + size(img,1)*[0:size(img,2)-1]) = 1;

rgb = zeros([size(img) 3]);
rgb(:,:,1) = (img - img.*edge_img) + edge_img;
rgb(:,:,2) = (img - img.*edge_img);
rgb(:,:,3) = (img - img.*edge_img);

% Show the original, detected region and edges in one figure
figure;
subplot(3,1,1)
  imshow(img1,[])
  title('Original image')
% subplot(3,1,1)
%   imshow(img2,[])
%   title('Original image')
subplot(3,1,2)
  imshow(fvr)
  title('Finger region')
 subplot(3,1,3)
  imshow(rgb)
  title('Finger edges') 


