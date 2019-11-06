clear
rng(1)
load('dip_hw_2.mat');
%% Compute (Ncut) Clustering tags for k = 2, 3, 4 %%
affinityMatrix_2a = Image2Graph(d2a);
affinityMatrix_2b = Image2Graph(d2b);
%%% Call ncut recursive %%%
clusterTags_2a = myNCuts_Recursion(affinityMatrix_2a, 0, 0, 'multiple');
clusterTags_2a_Spectral = mySpectralClustering(affinityMatrix_2a,2);
clusterTags_3a_Spectral = mySpectralClustering(affinityMatrix_2a,3);
clusterTags_2a_nCuts = myNCuts(affinityMatrix_2a,2);
clusterTags_3a_nCuts = myNCuts(affinityMatrix_2a,3);

clusterTags_2b = myNCuts_Recursion(affinityMatrix_2b, 0, 0, 'multiple');
clusterTags_2b_Spectral = mySpectralClustering(affinityMatrix_2b,2);
clusterTags_3b_Spectral = mySpectralClustering(affinityMatrix_2b,3);
clusterTags_2b_nCuts = myNCuts(affinityMatrix_2b,2);
clusterTags_3b_nCuts = myNCuts(affinityMatrix_2b,3);
%% Plot the Ncut (Recursive) clustering for d2a && d2b%%
fig10 = figure('Name','Ncut (Recursive) Clustering for d2a {Multiple steps}.','NumberTitle','off');
sgtitle('Ncut (Recursive) Clustering for d2a (Multiple steps)')
subplot(2,3,1)
imshow(d2a)
title('Original Photo')
subplot(2,3,2)
clusterTags_2a_Spectral = reshape(clusterTags_2a_Spectral, [50 50]);
clusterTags_2a_Spectral = clusterTags_2a_Spectral ./ max(max(clusterTags_2a_Spectral));
imshow(clusterTags_2a_Spectral')
title('Spectral Clustering k=2')
subplot(2,3,3)
clusterTags_3a_Spectral = reshape(clusterTags_3a_Spectral, [50 50]);
clusterTags_3a_Spectral = clusterTags_3a_Spectral ./ max(max(clusterTags_3a_Spectral));
imshow(clusterTags_3a_Spectral')
title('Spectral Clustering k=3')
subplot(2,3,4)
clusterTags_2a = reshape(clusterTags_2a, [50 50]);
clusterTags_2a = clusterTags_2a ./ max(max(clusterTags_2a));
imshow(clusterTags_2a')
title('NCut Recursive Clustering')
subplot(2,3,5)
clusterTags_2a_nCuts = reshape(clusterTags_2a_nCuts, [50 50]);
clusterTags_2a_nCuts = clusterTags_2a_nCuts ./ max(max(clusterTags_2a_nCuts));
imshow(clusterTags_2a_nCuts')
title('NCut Clustering k=2')
subplot(2,3,6)
clusterTags_3a_nCuts = reshape(clusterTags_3a_nCuts, [50 50]);
clusterTags_3a_nCuts = clusterTags_3a_nCuts ./ max(max(clusterTags_3a_nCuts));
imshow(clusterTags_3a_nCuts')
title('NCut Clustering k=3')
%print(fig10,'demo3c RGB','-dpng','-r0')

fig11 = figure('Name','Ncut (Recursive) Clustering for d2b {Multiple steps}.','NumberTitle','off');
sgtitle('Ncut (Recursive) Clustering for d2b (Multiple steps)')
subplot(2,3,1)
imshow(d2b)
title('Original Photo')
subplot(2,3,2)
clusterTags_2b_Spectral = reshape(clusterTags_2b_Spectral, [50 50]);
clusterTags_2b_Spectral = clusterTags_2b_Spectral ./ max(max(clusterTags_2b_Spectral));
imshow(clusterTags_2b_Spectral')
title('Spectral Clustering k=2')
subplot(2,3,3)
clusterTags_3b_Spectral = reshape(clusterTags_3b_Spectral, [50 50]);
clusterTags_3b_Spectral = clusterTags_3b_Spectral ./ max(max(clusterTags_3b_Spectral));
imshow(clusterTags_3b_Spectral')
title('Spectral Clustering k=3')
subplot(2,3,4)
clusterTags_2b = reshape(clusterTags_2b, [50 50]);
clusterTags_2b = clusterTags_2b ./ max(max(clusterTags_2b));
imshow(clusterTags_2b')
title('NCut Recursive Clustering')
subplot(2,3,5)
clusterTags_2b_nCuts = reshape(clusterTags_2b_nCuts, [50 50]);
clusterTags_2b_nCuts = clusterTags_2b_nCuts ./ max(max(clusterTags_2b_nCuts));
imshow(clusterTags_2b_nCuts')
title('NCut Clustering k=2')
subplot(2,3,6)
clusterTags_3b_nCuts = reshape(clusterTags_3b_nCuts, [50 50]);
clusterTags_3b_nCuts = clusterTags_3b_nCuts ./ max(max(clusterTags_3b_nCuts));
imshow(clusterTags_3b_nCuts')
title('NCut Clustering k=3')
%print(fig11,'demo3c Mario','-dpng','-r0')