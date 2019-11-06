function myAffinityMat = Image2Graph(imIn)
%Image2Graph
%Inputs:
%imIn: A MxNxn image {matrix}, which contains the image.
%return:
%myAffinityMat: The affinity Matrix of the image.
%
%At first, to make the code more efficient, i translate the MxNxn input
%matrix to (MN)xn matrix with respect to the rows {(1,1,:);(1,2,:);(1,3,:)...}.
%Then, for each row (aka each pixel from the new matrix) compute the
%brightness difference from the rows after and calculate e^(-d/sigma). 
%Finally, cause the affinity matrix is symmetric, copy the elements above of 
%the main diagonial to the remaining (zero) elements below.
%
    [M, N, n] = size(imIn);
    cellArray = cell(1,n); myAffinityMat = zeros(M * N, M * N);
    for channels = 1:n
        cellArray{channels} = imIn(:,:,channels);
        cellArray{channels} = cellArray{channels}';
        cellArray{channels} = reshape(cellArray{channels}, [], 1);
    end
    myArray = [cellArray{1:end}];
    variance = var(myArray, 0, 'all');
    for currPixel = 1:M*N
        currValue = myArray(currPixel,:);
        for nextPixel = currPixel:M*N
            d = vecnorm(myArray(nextPixel,:) - currValue);
            myAffinityMat(currPixel,nextPixel) = exp(-d/variance);
        end
    end
    %Knowing that myAffinityMat is symmetric
    myAffinityMat = (myAffinityMat + myAffinityMat') - eye(size(myAffinityMat,1)).*diag(myAffinityMat) ;