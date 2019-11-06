clear
rng(1)
load('dip_hw_2.mat');
%% Compute (Ncut) Clustering tags for k = 2, 3, 4 %%
affinityMatrix_2a = Image2Graph(d2a);
affinityMatrix_2b = Image2Graph(d2b);
%%% Call ncut recursive %%%
clusterTags_2a = myNCuts_Recursion(affinityMatrix_2a, 0, 0, 'once');
clusterTags_2a_Spectral = mySpectralClustering(affinityMatrix_2a,2);
clusterTags_2b = myNCuts_Recursion(affinityMatrix_2b, 0, 0, 'once');
clusterTags_2b_Spectral = mySpectralClustering(affinityMatrix_2b,2);
%% Plot the Ncut (Recursive) clustering for d2a && d2b%%
fig8 = figure('Name','Ncut (Recursive) Clustering for d2a {One step}.','NumberTitle','off');
sgtitle('Ncut (Recursive) Clustering for d2a (One step)')
subplot(1,3,1)
imshow(d2a)
title('Original Photo')
subplot(1,3,2)
clusterTags_2a = reshape(clusterTags_2a, [50 50]);
clusterTags_2a = clusterTags_2a ./ max(max(clusterTags_2a));
imshow(clusterTags_2a')
title('Clustering using Ncut Recursive once')
subplot(1,3,3)
clusterTags_2a_Spectral = reshape(clusterTags_2a_Spectral, [50 50]);
clusterTags_2a_Spectral = clusterTags_2a_Spectral ./ max(max(clusterTags_2a_Spectral));
imshow(clusterTags_2a_Spectral')
title('Clustering using Spectral Clustering k=2')
%print(fig8,'demo3b RGB','-dpng','-r0')

fig9 = figure('Name','Ncut (Recursive) Clustering for d2b {One step}.','NumberTitle','off');
sgtitle('Ncut (Recursive) Clustering for d2b (One step)')
subplot(1,3,1)
imshow(d2b)
title('Original Photo')
subplot(1,3,2)
clusterTags_2b = reshape(clusterTags_2b, [50 50]);
clusterTags_2b = clusterTags_2b ./ max(max(clusterTags_2b));
imshow(clusterTags_2b')
title('Clustering using Ncut Recursive once')
subplot(1,3,3)
clusterTags_2b_Spectral = reshape(clusterTags_2b_Spectral, [50 50]);
clusterTags_2b_Spectral = clusterTags_2b_Spectral ./ max(max(clusterTags_2b_Spectral));
imshow(clusterTags_2b_Spectral')
title('Clustering using Spectral Clustering k=2')
%print(fig9,'demo3b Mario','-dpng','-r0')
