function clusterIdx = myNCuts_Recursion(anAffinityMat,prevClusterIdx,maxLabel,itter)
%myNCuts_Recursion
%Inputs:
%anAffinityMat: A (MN)x(MN) matrix, which contains the affinity matrix of the image.
%prevClusterIdx: A matrix, which contains the cluster label of each pixel, 
%               from the previous recursive call. It's only a subset of the
%               final output, clusterIdx. At first call is 0.
%maxLabel: The max label of the clusters. At first call is 0.
%itter: A string, either 'once' for one step or 'multiple' for full
%       recursive call.
%return:
%clusterIdx: An array (MN)x1, which contains the cluster label of each pixel.
%
%At first we must do the same steps (with myNcuts) to make the 2 clusters.
%Then, we must compute the cost of the segmentation. If it is too expensive
%undo the segmentation and return, otherwise call the function again for
%the 2 segments. To make the call again, we must give as input, the subset
%of the affinityMatrix, contains only the elements of cluster1 and cluster2
%respectively. The same action for the clusterIdx. Finally, we must give as
%an argument the max label of the clusterIdx, so the numbering of the
%clusters doesn't conflict.
%
    rng(1)
    D = diag( sum(anAffinityMat(:,:)) );     
    Laplacian = D - anAffinityMat;
    [eigenVectors, ~] =  eigs(Laplacian, D, 2, 'smallestreal');
    clusterIdx = kmeans(eigenVectors,2);
    if strcmp(itter, 'once')
        multipleClustering = 0; 
    else
        multipleClustering = 1;
    end
 %%% Keep track the ids of the last recursive call and count the labels %%%
    idxCluster_1 = clusterIdx == 1; numberLabel1 = sum(idxCluster_1(:)==1);
    idxCluster_2 = clusterIdx == 2; numberLabel2 = sum(idxCluster_2(:)==1);
    nCutValue = calculateNcut(anAffinityMat, clusterIdx);
    fprintf('The cost of the segmentation is %d\n',nCutValue);
    if nCutValue > 0.2 || numberLabel1 < 5 || numberLabel2 < 5
  %%% Undo the changes if a cut was wrong %%%
        clusterIdx = prevClusterIdx;
        return
    else
        if multipleClustering
   %%% Update the labels to the correct label %%%
            clusterIdx = clusterIdx + maxLabel;
   %%% Take care to make sub-affinities matrixes, symmetric and quadratic %%% 
           aff_Cluster1 = anAffinityMat(idxCluster_1,idxCluster_1);
           aff_Cluster2 = anAffinityMat(idxCluster_2,idxCluster_2);
   %%% Call recursive the algorithm %%%
           maxLabel = max(clusterIdx);
           clusterIdx(idxCluster_1) = myNCuts_Recursion(aff_Cluster1,clusterIdx(idxCluster_1), maxLabel, 'multiple');
           maxLabel = max(clusterIdx);      %Cause of the recursion the maxLabel, may be affected.
           clusterIdx(idxCluster_2) = myNCuts_Recursion(aff_Cluster2,clusterIdx(idxCluster_2), maxLabel, 'multiple');
        end
    end
end