clc;close all;clearvars 
%read in image and seperate layers and find out stuff about it
imdata = imread ('compression.jpg');
R = imdata(:,:,1);
G = imdata(:,:,2);
B = imdata(:,:,3);
org_size = whos('imdata');
%change data type to do math
R = double(R);
G = double(G);
B = double(B);
%find eigen vectors and values
[Vr,Dr] = eigs(R);
[Vg,Dg] = eigs(G);
[Vb,Db] = eigs(B);
%create a new image matrix and a vector for the byte ratio
compim = zeros(855,855,3);
compression_ratio = [];
for i = 1:6
    %use the spectral theorem on each layer
    compim(:,:,1) = compim(:,:,1)+(Dr(i,i)*Vr(:,i)*(Vr(:,i))');
    compim(:,:,2) = compim(:,:,2)+(Dg(i,i)*Vg(:,i)*(Vg(:,i))');
    compim(:,:,3) = compim(:,:,3)+(Db(i,i)*Vb(:,i)*(Vb(:,i))');
    %change data type back in a new variable so i dont have to do it every
    %loop
    compim_loop = uint8(compim);
    %info about the new 'image' and get a byte comparison
    new_size = whos('compim_loop');
    compression_ratio(end+1) = (new_size.bytes)/(org_size.bytes); %#ok<*SAGROW>
    %show the new image next to the origonal
    figure(1)
    subplot(2,2,1)
    imshow(compim_loop)
    clc
    subplot(2,2,2)
    imshow(imdata)
    clc
    subplot(2,2,[3 4])
    %plot the compression ratio as we go
    plot(compression_ratio)
    axis([1 6 0 3])
    pause(1.5)
end
%none of this makes any sense to do because the image has imaginary eigen
%values but its still cool kinda replacing with svd when we learn that will
%solve this problem presumably 

