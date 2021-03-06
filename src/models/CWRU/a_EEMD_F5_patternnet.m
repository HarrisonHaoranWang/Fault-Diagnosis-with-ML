clear;
Z = 5;
M = 700;
F_stacked = zeros(Z + 1, M);

% load the CWRU data set, and stack features
load('data/processed/CWRU/a_EEMD_F5_z0.mat');
F_stacked(1, :) = F;
load('data/processed/CWRU/a_EEMD_F5_z0.5.mat');
F_stacked(2, :) = F;
load('data/processed/CWRU/a_EEMD_F5_z1.mat');
F_stacked(3, :) = F;
load('data/processed/CWRU/a_EEMD_F5_z1.5.mat');
F_stacked(4, :) = F;
load('data/processed/CWRU/a_EEMD_F5_z2.mat');
F_stacked(5, :) = F;
F_stacked(6, :) = mean(F_stacked, 1);

% set random seed
setdemorandstream(491218382)

% initialise the pattern neural network
net = patternnet([10], 'traingdx', 'crossentropy');

% train the pattern neural network
[net,tr] = train(net, F_stacked, T_onehot);
nntraintool