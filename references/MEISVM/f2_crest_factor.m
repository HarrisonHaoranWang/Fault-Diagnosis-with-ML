%{
    Feature 2: the crest factor
    @param x: a signal seris
    @param N: the number of data points
    @return F2: feature 2, the crest factor
%}
function F2 = f2_crest_factor(x, N)
F2 = maxabs(x) / sqrt(sumsqr(x) / N);
end