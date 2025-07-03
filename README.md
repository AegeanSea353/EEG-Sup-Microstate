# EEG-Sup-Microstates

NOTE:
1) The MICROSTATELAB toolbox and its custom code (e.g., for simple parameter calculation and visualization) require MATLAB version R2021b or later and EEGLAB v2021 or later (need to be tested for other versions).
2) For full description, tutorial, and recommendation settings about the MICROSTATELAB, pls refer to the instruction article:
Nagabhushan Kalburgi, S., Kleinert, T., Aryan, D. et al. MICROSTATELAB: The EEGLAB Toolbox for Resting-State Microstate Analysis. Brain Topogr (2023).

AutoSaveData.m:
You can use this script to automatically save all datasets when they are loaded in the GUI of EEGLAB or Workspace.

BeforeMICROSTATELAB.m:
This is a pipeline for further steps applied in MICROSTATELAB, including second-filter (for microstate analysis), resampling (optional), re-reference (optional), format-settings, etc..

Cal_slopes.m:
A simple script to calculate slopes (k) after obtaining 'GEV + CV' (or other ways of assessment parameter) validation, in order to choose the best clustering solution.

CohenD_main.m:
Added to a computation for the Cohen's D effect size (power of stats), which can be seen as a supplementary during statistics performance.

TopoPlot.m:
Topoplotting microstate maps from the MICROSTATELAB plugin for visualization.
Added an extra independent section to help users extract each electrode amplitude in the mean MS maps (if users were not planning to conduct and only want to plot topo, just comment this part of the section).
