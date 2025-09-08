function permutation_array = RandomPermutation(n,m)
    % Returns a two dimensional array where each row is a pair of numbers.
    % Every combination of numbers from 1 to n and 1 to m is present in the
    % array. The order of the numbers in each pair is random.
    permutation_array = zeros(n*m,2);
    for i = 1:n
        for j = 1:m
            permutation_array((i-1)*m+j,:) = [i,j];
        end
    end
    permutation_array = permutation_array(randperm(n*m),:);
end