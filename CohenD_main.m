%% Computing Cohen's d as effect size while conducting paired/unpaired t-tests

clear;
addpath('Utils');

Root = 'E:\HIAO\MICROSTATELAB\'; % Set root path

% Set stat path of two groups
Statfile_g1 = [Root 'Output\HealthyControls\TemporalParameters_7 classes_Mean_HC_Template.csv']; 
Statfile_g2 = [Root 'Output\EP_OutPatients\TemporalParameters_7 classes_Mean_EPOP_Template.csv']; 

% Set prefix of two groups
prefix_g1 = 'HC';
prefix_g2 = 'EPOP';

% Set Cohen's D output path
Csvpath = [Root '\Csv\CohenD\'];

Data_g1 = readtable(Statfile_g1,'VariableNamingRule','preserve');
Data_g2 = readtable(Statfile_g2,'VariableNamingRule','preserve');

col_index = 7:127; % Flexible to adjust according to .csv file,
% which is set as 7 classes situation currently
% 7:13 = Ind ExpVar A-G
% 14:21 = Duration A-G + All
% 22:29 = Occurrence A-G + All, note here is 'All' not 'Mean'
% 30:36 = Coverage A-G
% 37:43 = MeanGFP A-G
% 44:85 = OrgTM
% 86:127 = DeltaTM

CohenD_head = Data_g1.Properties.VariableNames(col_index)'; % Obtain headers
CohenD_val = []; CohenD_table = table(); % Initialization

for i = col_index

    x1 = Data_g1.(Data_g1.Properties.VariableNames{i});
    x2 = Data_g2.(Data_g2.Properties.VariableNames{i});
    CohenD = computeCohen_d(x1,x2,'independent'); % Computing Cohen's D
    CohenD_val = [CohenD_val; CohenD];

end

% Merging to a table
CohenD_head_str = string(CohenD_head);
for k = 1:numel(CohenD_head_str)
    CohenD_table.(CohenD_head_str{k}) = CohenD_val(k);
end

writetable(CohenD_table,[Csvpath 'CohenD_' prefix_g1 '_' prefix_g2 '.csv']); % Exporting the table eventually
