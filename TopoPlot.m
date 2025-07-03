%% Topoplot from microstate classes with custom style %%

clear;
eeglab;
close all;
addpath('Utils');

% Set MS-done dataset path
root = 'E:\MICROSTATELAB\Output\Patients\Set\';

% Set your prefix of data
prefix = 'G1';

n_class = 4; % Set the number of classes
nchannel = 257; % Set the number of channels

dataset_dir = dir([root '*.set']);
dataset_dir = dataset_dir(~strcmp({dataset_dir.name},'.set')); % Delete the mean .set of groups
dataset = zeros(length(dataset_dir),n_class,nchannel);
load('custom_colormap.mat'); % Loading your custom colormap file

% loading MS-done dataset
for dir_i = 1:length(dataset_dir)

   set_name = dataset_dir(dir_i).name;
   EEG = pop_loadset('filename',set_name,'filepath',root);
   dataset(dir_i,:,:) = EEG.msinfo.MSMaps(n_class).Maps;

end

dataset = squeeze(mean(dataset,1)); % Subject average

eeg = pop_loadset('filepath','template_EGI256.set'); % Loading template, specifically for EGI-256 system

% Topoploting
for i=1:n_class

    miu = -dataset(i,:);
    figure;
    topoplot(miu,eeg.chanlocs, ...
        'colormap',custom_colormap, ...
        'style','map', ...
        'maplimits',[-0.05,0.05]);
    saveas(gcf,['Fig\' prefix '_' num2str(n_class) '.' num2str(i) '.tiff'])
    % For the polarity reversal topoplots, use -dataset(i,:) to plot again
    % close(gcf);

end

%% Extracting grand mean MS maps to a text file for further usage %%

% Maps_class = 7; % Set the number of classes u plan to extract
% Meanset_file = 'E:\MICROSTATELAB\Output\Patients\Set\'; % Set the grand mean .set path
% Groupname = 'g1'; % Set the prefix of group
% Ascpath = 'E:\MICROSTATELAB\Asc\'; % Set output path
 
% EEG_mean = pop_loadset('filename','.set','filepath',Meanset_file); % Where the grand mean MS maps named '.set'

% MS_maps = EEG_mean.msinfo.MSMaps(Maps_class).Maps;
% writematrix(MS_maps,[Ascpath 'MS_' Groupname '_' num2str(Maps_class) 'maps.txt'],'delimiter','\t'); % Exporting to a .txt file
