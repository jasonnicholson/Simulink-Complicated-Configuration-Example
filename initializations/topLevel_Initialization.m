try
    %% set the active variant in option A
    currentBlockPath = gcb;
    optionAblockPath = [currentBlockPath '/' 'Option A'];
    optionAlabel = sprintf('Option_%s', optionA);
    set_param(optionAblockPath, 'LabelModeActiveChoice', optionAlabel);
    
    % This will cause the initialization of the active variant to launch.
    % We only want to do this 2 levels down at most because renaming blocks
    % breaks this code. Limiting how far down into the model we reach keeps
    % the damage of renaming to a minimum this it is easier to update/fix.
    optionAactiveSubsystemPath = [optionAblockPath, '/Option ', optionA];
    set_param(optionAactiveSubsystemPath, 'optionB', optionB, 'optionC', num2str(optionC,16));
    
    %% set the active variant in option D
    optionDnumeric = str2double(optionD);
    optionDblockPath = [currentBlockPath '/' 'Option D'];
    
    % mapping of option D to style 1 and 2
    OPTION_D_STYLE_1 = [37,38,39,40,41,42,43,44,56,57,59,60];
    OPTION_D_Style_2 = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,45,46,47,48,49,50,51,52,53,54,55,58,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76];
    
    if  ismember(optionDnumeric,OPTION_D_STYLE_1)
        styleBlockName = 'Style 1';
        set_param(optionDblockPath, 'LabelModeActiveChoice', 'Style_1');
    elseif ismember(optionDnumeric, OPTION_D_Style_2)
        styleBlockName = 'Style 2';
        set_param(optionDblockPath, 'LabelModeActiveChoice', 'Style_2');
    end
    
    % This will cause the initialization of the active variant to launch.
    % We only want to do this 2 levels down at most because renaming blocks
    % breaks this code. Limiting how far down into the model we reach keeps
    % the damage of renaming to a minimum this it is easier to update/fix.
    optionDactiveSubsystemPath = [optionDblockPath, '/', styleBlockName];
    set_param(optionDactiveSubsystemPath, 'optionE', optionE, 'optionF', optionF);
    
catch exception
    betterSimulinkExceptions(exception);
end




%% work around to fix dependency analysis
% TODO remove this once Mathworks fixes the Depdency Analysis.
optionA = eval('optionA');
optionB = eval('optionB');
optionC = eval('optionC');
optionD = eval('optionD');
optionE = eval('optionE');
optionF = eval('optionF');