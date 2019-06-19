try
    % set the active variant in option A
    currentBlockPath = gcb;
    optionAblockPath = [currentBlockPath '/' 'Option A'];
    optionAlabel = sprintf('Option_%s', optionA);
    set_param(optionAblockPath, 'LabelModeActiveChoice', optionAlabel);
    
    % This will cause the initialization of the active variant to launch.
    % We only want to do this 2 levels down at most because renaming blocks
    % breaks this code. Limiting how far down into the model we reach keeps
    % the damage of renaming to a minimum this it is easier to update/fix.
    optionAactiveSubsystemPath = sprintf('%s/Option %s', optionAblockPath, optionA);
    set_param(optionAactiveSubsystemPath, 'optionB', optionB, 'optionC', num2str(optionC,16));
catch exception
    betterSimulinkExceptions(exception);
end