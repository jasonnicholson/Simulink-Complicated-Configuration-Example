try
    %% Configure what data to load
    if optionE <= 17
        load('Style2_OptionE_Data1','E');
    elseif optionE > 17 && optionE <= 22
        load('Style2_OptionE_Data2','E');
    end
    
catch exception
    betterSimulinkExceptions(exception);
end

%% work around to fix dependency analysis
% TODO remove this once Mathworks fixes the Depdency Analysis.
optionE = eval('optionE');