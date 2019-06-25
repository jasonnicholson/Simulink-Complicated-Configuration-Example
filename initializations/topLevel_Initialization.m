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
    optionDblockPath = [currentBlockPath '/' 'Option D'];
    
    switch optionA
        case {'4','6'}
            styleBlockName = 'Style 1';
        case {'1','2','3','5'}
            styleBlockName = 'Style 2';
        otherwise
            error('There is a bug. Please check the initialization.');
    end
    
    set_param(optionDblockPath, 'LabelModeActiveChoice', replace(styleBlockName,' ','_'));
    
    % This will cause the initialization of the active variant to launch.
    % We only want to do this 2 levels down at most because renaming blocks
    % breaks this code. Limiting how far down into the model we reach keeps
    % the damage of renaming to a minimum this it is easier to update/fix.
    optionDactiveSubsystemPath = [optionDblockPath, '/', styleBlockName];
    set_param(optionDactiveSubsystemPath, 'optionD', optionD, 'optionE', optionE, 'optionF', optionF);
    
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