%{
    Select sensitive IMF after EEMD algoirithm
    @param A: the sensitive IMF (N, 1, M)
    @param sf: the sampling frequency
    @param z: the z-score
    @return 
%}
function F = extract_EEMD_feature(A, sf, z)
    % N: the number of data points in each sample
    % M: the number of samples
    [N, ~, M] = size(A);
    F = zeros(7, M);
    for m=1:M
        % feature 1: standard deviation
        F(1, m) = std(A(:, 1, m));
        % feature 2: kurtosis
        F(2, m) = kurtosis(A(:, 1, m));
        % feature 3: shape factor
        F(3, m) = sqrt(sum(A(:, 1, m) .^ 2) / N) / (sumabs(A(:, 1, m)) / N);
        % feature 4: impulse factor
        F(4, m) = max(abs(A(:, 1, m))) / (sum(abs(A(:, 1, m))) / N);
        % feature 5: mean frequency
        F(5, m) = compute_mean_frequency(x, sf, z);
        % feature 6: root mean square frequency
        F(6, m) = compute_root_mean_square_frequency(x, sf, z);
        % feature 7: standard deviation frequency
        F(7, m) = compute_standard_deviation_frequency(x, sf, z);
    end 
end

