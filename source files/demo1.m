clear
rng(1)
load('dip_hw_2.mat');
%% Compute (Spectral) Clustering tags for k = 2, 3, 4 %%
%%% k = 2 %%%
clusterTags_2 = mySpectralClustering(d1a,2);
%%% k = 3 %%%
clusterTags_3 = mySpectralClustering(d1a,3);
%%% k = 4 %%%
clusterTags_4 = mySpectralClustering(d1a,4);
%% Plot the Spectral clustering for d1a %%
fig1 = figure('Name','Spectral Clustering for d1a.','NumberTitle','off');
sgtitle('Spectral Clustering for d1a')
subplot(2,2,1)
imshow(d1a)
title('Original Photo')
subplot(2,2,2)
clusterTags_2 = reshape(clusterTags_2, [3 4]);
clusterTags_2 = clusterTags_2 ./ max(max(clusterTags_2));
imshow(clusterTags_2')
title('Clustering for k = 2')
subplot(2,2,3)
clusterTags_3 = reshape(clusterTags_3, [3 4]);
clusterTags_3 = clusterTags_3 ./ max(max(clusterTags_3));
imshow(clusterTags_3')
title('Clustering for k = 3')
subplot(2,2,4)
clusterTags_4 = reshape(clusterTags_4, [3 4]);
clusterTags_4 = clusterTags_4 ./ max(max(clusterTags_4));
imshow(clusterTags_4')
title('Clustering for k = 4')
%print(fig1,'demo1','-dpng','-r0')