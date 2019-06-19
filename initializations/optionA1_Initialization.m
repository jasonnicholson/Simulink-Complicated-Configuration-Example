try
    load('optionA1_data')
    setOptionB(gcb,optionB);
catch exception
    betterSimulinkExceptions(exception);
end

%% work around to fix dependency analysis
% TODO remove this once depdency analysis is fixed.
optionB = eval('optionB');
optionC = eval('optionC');