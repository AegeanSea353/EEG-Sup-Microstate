%% Calculating slopes for choosing best clustering solution %% 

clear;

% Set validation figpath
fighandle = openfig('E:\MICROSTATELAB\Output\g1_valid.fig', ...
    'invisible');
axeshandle = findobj(fighandle,'Type','axes');

% Default: Combined GEV and CV for assessment
for i = 1:length(axeshandle)

    linehandle = findobj(axeshandle(i),'Type','line');
    classnum = get(linehandle(1),'XData');
    gev_var = get(linehandle(2),'YData'); cv_var = get(linehandle(3),'YData');
    % gev_var = get(linehandle(4),'YData'); cv_var = get(linehandle(5),'YData');
    % xLabelText = get(get(axeshandle(i),'XLabel'),'String');
    % yLabelText = get(get(axeshandle(i),'YLabel'),'String');  
    
end

% Calculate k
k_gev = diff(gev_var) ./ diff(classnum);
k_cv = diff(cv_var) ./ diff(classnum);

disp(k_gev);
disp(k_cv);
disp(classnum(2:end));
