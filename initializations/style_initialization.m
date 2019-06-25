try
    %% Set active option E and F options
    currentBlockPath = gcb;
    
    if strcmpi(optionF,'none')
        activeBlockName = 'Option E Only';
        set_param(currentBlockPath,'LabelModeActiveChoice', replace(activeBlockName,' ','_'));
        activeBlockPath = [currentBlockPath '/' activeBlockName];
        set_param(activeBlockPath, 'optionE', optionE);
    else
        activeBlockName = 'Option E and Option F';
        set_param(currentBlockPath,'LabelModeActiveChoice', replace(activeBlockName,' ','_'));
        activeBlockPath = [currentBlockPath '/' activeBlockName];
        set_param(activeBlockPath, 'optionE', optionE, 'optionF', optionF);
    end
catch exception
    betterSimulinkExceptions(exception);
end

%% work around to fix dependency analysis
% TODO remove this once Mathworks fixes the Depdency Analysis.
optionE = eval('optionE');
optionF = eval('optionF');