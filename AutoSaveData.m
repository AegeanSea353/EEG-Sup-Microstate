% You can use the codes below to automatically save all datasets 
% when all datasets were loaded in GUI or Workspace

despath = 'E:\MICROSTATELAB\Output\Set\';

for f = 1:numel(ALLEEG)

    EEG = eeg_retrieve(ALLEEG,f);
    fname = [EEG.filename(1:end-4),'.set'];
    pop_saveset(EEG,'filename',fname,'filepath',despath);
    
end
