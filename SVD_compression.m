%SVD compression with spectral theorem
clc; close all; clear all; %#ok<CLALL>
%use this line for general use
%picture_name = input('Enter the name of your picturec ','s');
%use this line if you are testing
picture_name = 'compression.jpg';
%checks that the requested file is a image
if (exist(picture_name,'file') ~= 2) || (isempty(strfind(picture_name,'.png')) && isempty(strfind(picture_name,'.jpg')))
    error('The requested picture is not in the current path or is not an image')
end
%load the picture, get the size, split it into RGB
imdata = imread(picture_name);
[m,n,d] = size(imdata);
%this will allow you to acuttually have the image compressed to some rank
rank = input('What rank do you want to compress to? (enter 0 for the animation) ');
%use this line for testing
%rank = 20;
if rank < 0 || rank > min(m,n)
    error('The requested limit is outside the acceptable rang')
elseif  rank > 0 && rank <= min(m,n)
    limit = rank;
else
    limit = min(m,n);
end
%RGBs have to be doubles to be SVDed
R = double(imdata(:,:,1));
G = double(imdata(:,:,2));
B = double(imdata(:,:,3));
%get the svd for each
[Ur,Sr,Vr] = svd(R);
[Ug,Sg,Vg] = svd(G);
[Ub,Sb,Vb] = svd(B);
%workspace cleaning
clear R G B
%empty matrix sixe of the picture
compim = zeros(m,n,d);
time = zeros(1,limit);
magnitude = zeros(1,limit);
%two loops, a slow one with analyitics and a faster one
analytics = true;
if analytics == true
    for i = 1:limit
        %timing for the optimization section timing it slows it down though
        tic()
        %use spectral theorem one each SVD, update the empty compim matrix
        compim(:,:,1) = compim(:,:,1) + (Sr(i,i)*Ur(:,i)*Vr(:,i)');
        compim(:,:,2) = compim(:,:,2) + (Sg(i,i)*Ug(:,i)*Vg(:,i)');
        compim(:,:,3) = compim(:,:,3) + (Sb(i,i)*Ub(:,i)*Vb(:,i)');
        %convert compim back into a uint type for use with imshow
        compim_show = uint8(compim);
        imshow(compim_show)
        %checking here to see at what point each new addition becomes
        %insignifigant
        magnitude(i) = norm(Sb(i,i)*Ub(:,i)*Vb(:,i)');
        time(i) = toc();
    end
else
    for i = 1:limit
        %use spectral theorem one each SVD, update the empty compim matrix
        compim(:,:,1) = compim(:,:,1) + (Sr(i,i)*Ur(:,i)*Vr(:,i)');
        compim(:,:,2) = compim(:,:,2) + (Sg(i,i)*Ug(:,i)*Vg(:,i)');
        compim(:,:,3) = compim(:,:,3) + (Sb(i,i)*Ub(:,i)*Vb(:,i)');
        %convert compim back into a uint type for use with imshow
        compim_show = uint8(compim);
        imshow(compim_show)
    end
end
%displays the compressed image with its rank
figure(1)
s1 = sprintf('Rank %.d approximation of',rank);
C = {s1,picture_name};
s1 = strjoin(C,' ');
title(s1)

%displays the original image
figure(2)
s2 = sprintf('Original image of');
C = {s2,picture_name};
s2 = strjoin(C,' ');
imshow(imdata)
title(s2)

%clear variables so i dont overfill RAM
clear compim compim_show Vr Vg Vb Ur Ug Ub Sr Sg Sb

%this whole block is for performance optimizaion
if (analytics == true)
    %find the compression ratio at each iteration
    imdata = whos('imdata');
    imdata_bytes = imdata.bytes;
    total_space = ((m*n*64+8)*(1:limit))/(1*10^6);
    ratio = imdata_bytes./total_space;
    clear imdata

    figure(3)
    %plot the compression ratio
    subplot(2,2,[1 2])
    plot(1:limit,ratio,1:limit,magnitude)
    axis([1 limit 0 max(max(ratio,magnitude))])
    title('Ratio of Bytes Original:Approximation and Magnitude of Addition')
    xlabel('Itteration of Approximation')
    legend('Ratio','Magnitude')

    subplot(2,2,[3 4])
    %plot the time for each itteration
    plot(1:limit,time)
    axis([1 limit (min(time)-std(time)) (max(time)+std(time))])
    title('Time to process the i^t^h iteration')
    ylabel('Seconds')
    xlabel('Itteration of approximation')
end