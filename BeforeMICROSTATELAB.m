%% Pipeline for further steps in MICROSTATELAB %%

clear;
% addpath 'E:\MATLAB_R2021a\eeglab2020_0'; % Add util of eeglab path when first open MATLAB
eeglab;
close all; 

Root = 'E:\MICROSTATELAB\'; % Set root path

Org_setpath = [Root 'Done\']; % Set the path of preprocessed dataset
Exp_setpath = [Root 'Patients\']; % Set the path of exported dataset

MSlowfilteredge =1; % Locutoff settings for microstate analysis
MShighfilteredge = 40; % Hicutoff settings for microstate analysis

cd(Org_setpath);
data = dir('*.set');
datalist = {data.name};

for subjnum = 1:numel(datalist)
    
    % Loading dataset
    EEG = pop_loadset('filename',datalist{subjnum},'filepath',Org_setpath);
    
    % Shortening EEG data for recordings alignment or less computation (optional)
    CurrentLength = EEG.xmax;
        if CurrentLength > 600
            EEG = pop_select(EEG,'time',[0 600]);
        end

    % Second bandpass filtering for microstates analysis
    EEG = pop_eegfiltnew(EEG,'locutoff',MSlowfilteredge,'hicutoff',MShighfilteredge,'plotfreqz',0);

    % Only to evaluate below if your data are not computing average reference
    % EEG = pop_reref(EEG,[]);

    % Empty unnecessary markers (if needed)
    % EEG.event = [];

    % Segmented 2-s epochs (default settings) within the data
    EEG = eeg_regepochs(EEG,'recurrence',2,'limits',[0 2],'rmbase',nan);

    % Specific format according to the instruction of MICROSTATELAB
    newname = sprintf('S%02d.set',subjnum); 
    EEG = pop_saveset(EEG,'filename',newname,'filepath',Exp_setpath);

end
