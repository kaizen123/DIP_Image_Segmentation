clear
rng(1)
load('dip_hw_2.mat');
%% Compute (Spectral) Clustering tags for k = 2, 3, 4 %%
affinityMatrix_2a = Image2Graph(d2a);
affinityMatrix_2b = Image2Graph(d2b);
%%% k = 2 %%%
clusterTags_2a = mySpectralClustering(affinityMatrix_2a,2);
clusterTags_2b = mySpectralClustering(affinityMatrix_2b,2);
%%% k = 3 %%%
clusterTags_3a = mySpectralClustering(affinityMatrix_2a,3);
clusterTags_3b = mySpectralClustering(affinityMatrix_2b,3);
%%% k = 4 %%%
clusterTags_4a = mySpectralClustering(affinityMatrix_2a,4);
clusterTags_4b = mySpectralClustering(affinityMatrix_2b,4);
%% Plot the Spectral clustering for d2a && d2b%%
fig2 = figure('Name','Spectral Clustering for d2a.','NumberTitle','off');
sgtitle('Spectral Clustering for d2a')
subplot(2,2,1)
imshow(d2a)
title('Original Photo')
subplot(2,2,2)
clusterTags_2a = reshape(clusterTags_2a, [50 50]);
clusterTags_2a = clusterTags_2a ./ max(max(clusterTags_2a));
imshow(clusterTags_2a')
title('Clustering for k = 2')
subplot(2,2,3)
clusterTags_3a = reshape(clusterTags_3a, [50 50]);
clusterTags_3a = clusterTags_3a ./ max(max(clusterTags_3a));
imshow(clusterTags_3a')
title('Clustering for k = 3')
subplot(2,2,4)
clusterTags_4a = reshape(clusterTags_4a, [50 50]);
clusterTags_4a = clusterTags_4a ./ max(max(clusterTags_4a));
imshow(clusterTags_4a')
title('Clustering for k = 4')
%print(fig2,'demo2 RGB','-dpng','-r0')
fig3 = figure('Name','Graph of d2a.','NumberTitle','off');
warning('off', 'Images:initSize:adjustingMag');
imshow(affinityMatrix_2a)
title('Graph of d2a' )
%print(fig3,'Graph of d2a','-dpng','-r0')

fig4 = figure('Name','Spectral Clustering for d2b.','NumberTitle','off');
sgtitle('Spectral Clustering for d2b')
subplot(2,2,1)
imshow(d2b)
title('Original Photo')
subplot(2,2,2)
clusterTags_2b = reshape(clusterTags_2b, [50 50]);
clusterTags_2b = clusterTags_2b ./ max(max(clusterTags_2b));
imshow(clusterTags_2b')
title('Clustering for k = 2')
subplot(2,2,3)
clusterTags_3b = reshape(clusterTags_3b, [50 50]);
clusterTags_3b = clusterTags_3b ./ max(max(clusterTags_3b));
imshow(clusterTags_3b')
title('Clustering for k = 3')
subplot(2,2,4)
clusterTags_4b = reshape(clusterTags_4b, [50 50]);
clusterTags_4b = clusterTags_4b ./ max(max(clusterTags_4b));
imshow(clusterTags_4b')
title('Clustering for k = 4')
%print(fig4,'demo2 Mario','-dpng','-r0')
fig5 = figure('Name','Graph of d2b.','NumberTitle','off');
imshow(affinityMatrix_2b)
title('Graph of d2b' )
%print(fig5,'Graph of d2b','-dpng','-r0')