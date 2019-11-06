function clusterIdx = mySpectralClustering(anAffinityMat,k)
%mySpectralClustering
%Inputs:
%anAffinityMat: A (MN)x(MN) matrix, which contains the affinity matrix of the image.
%k: The request number of clusters.
%return:
%clusterIdx: An array (MN)x1, which contains the cluster label of each pixel.
%
%At first we must compute the diagonial of the affinity Matrix. Then, the
%Laplacian matrix which indicates the smoothness of the affinity Matrix.
%Finally, compute the k smallest-real eigenvalues (and eigenvectors) and
%grouped them into k-clusters.
%
    rng(1)
    D = diag( sum(anAffinityMat(:,:)) );     
    Laplacian = D - anAffinityMat;
    [eigenVectors, ~] =  eigs(Laplacian,k,'smallestreal');
    clusterIdx = kmeans(eigenVectors,k);
end