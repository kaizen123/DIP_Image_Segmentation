function nCutValue = calculateNcut(anAffinityMat,clusterIdx)
%calculateNcut
%Inputs:
%anAffinityMat: A (MN)x(MN) matrix, which contains the affinity matrix of the image.
%clusterIdx: A (MN)x1 matrix, which contains the cluster label of each pixel.
%return:
%nCutValue: The cost of the segmentation.
%
%At first, we zero the main diagonial of the anAffinityMat, because we care
%about the connection each pixel has with the other pixels. To continue, we
%must find the -logical- index of clusterIdx, which contains 1 and 2,respectively.
%Then, compute the association between the clusters and finally, calculate
%the cost of the segmentation.
%
%%% Zero at main diagonial (we dont care about the same pixel) %%%
anAffinityMat = anAffinityMat - diag(diag(anAffinityMat));
%%% Split the Affinity Matrix {both columns and rows}, according to cluster id's %%%
idxCluster_1 = clusterIdx == 1;
idxCluster_2 = clusterIdx == 2;
%%% Calculate association between the clusters...
AAassoc = sum(sum(anAffinityMat(idxCluster_1,idxCluster_1)));    %%A with A
AVassoc = sum(sum(anAffinityMat(idxCluster_1,:)));               %%A with A, B
BBassoc = sum(sum(anAffinityMat(idxCluster_2,idxCluster_2)));    %%B with B
BVassoc = sum(sum(anAffinityMat(idxCluster_2,:)));               %%B with A, B

nAssocValue = (AAassoc / AVassoc) + (BBassoc / BVassoc);
nCutValue = 2 - nAssocValue;
end