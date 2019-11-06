clear
rng(1)
load('dip_hw_2.mat');
%% Compute (Ncut) Clustering tags for k = 2, 3, 4 %%
affinityMatrix_2a = Image2Graph(d2a);
affinityMatrix_2b = Image2Graph(d2b);
%%% k = 2 %%%
clusterTags_2a = myNCuts(affinityMatrix_2a,2);
clusterTags_2b = myNCuts(affinityMatrix_2b,2);
%%% k = 3 %%%
clusterTags_3a = myNCuts(affinityMatrix_2a,3);
clusterTags_3b = myNCuts(affinityMatrix_2b,3);
%%% k = 4 %%%
clusterTags_4a = myNCuts(affinityMatrix_2a,4);
clusterTags_4b = myNCuts(affinityMatrix_2b,4);
%% Plot the Ncut clustering for d2a && d2b%%
fig6 = figure('Name','Ncut Clustering for d2a.','NumberTitle','off');
sgtitle('Ncut Clustering for d2a')
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
%print(fig6,'demo3a RGB','-dpng','-r0')

fig7 = figure('Name','Ncut Clustering for d2b.','NumberTitle','off');
sgtitle('Ncut Clustering for d2b')
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
%print(fig7,'demo3a Mario','-dpng','-r0')