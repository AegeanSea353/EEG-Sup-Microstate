function topo = mstate_topo_func(root,n_class,nchannel)

dataset_dir = dir([root '*.set']);
dataset_dir = dataset_dir(~strcmp({dataset_dir.name},'.set')); % Delete the mean .set of groups
topo = zeros(length(dataset_dir),n_class,nchannel);

for dir_i = 1:length(dataset_dir)
   set_name = dataset_dir(dir_i).name;
   EEG = pop_loadset('filename',set_name,'filepath',root);
   topo(dir_i,:,:) = EEG.msinfo.MSMaps(n_class).Maps;
end

topo = squeeze(mean(topo,1));

end
