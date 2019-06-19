function optionD(thisBlock)
% Specific function to configure the mask based on option D
%
%   optionD(thisBlock)
%
%% Inputs
%    thisBlock - Handle of the block to configure

% Author(s): Jason Nicholson
% $Date: 2019/06/11 14:37:00 $

%% Configure options E and F
try
    % get the current value of the optionD. Note this must be done with
    % get_param and not using thisMask because thisMask does not contain
    % the updated optionD value yet.
    optionDvalue = get_param(thisBlock,'optionD');
    optionDvalueNumeric = str2double(optionDvalue);
    
    % Get the current block and mask
    thisMask = Simulink.Mask.get(thisBlock);
    
    % configure option F
    optionEparameter = thisMask.getParameter('optionE');
    switch optionDvalueNumeric
        case num2cell(13:27)
            % setup options
            options = num2cell(1:17);
            options = cellfun(@(x) num2str(x), options, 'UniformOutput', false);
            optionEparameter.TypeOptions = options;
        case num2cell([1:12 28:77])
            % setup options
            options = num2cell(1:22);
            options = cellfun(@(x) num2str(x), options, 'UniformOutput', false);
            optionEparameter.TypeOptions = options;
        otherwise
            optionEparameter.TypeOptions = {'none'};
            error('Unable to configure Option F. This is not normal. There is probably a bug. Did you add a new option?');
    end
    
    % configure option F
    optionFparameter = thisMask.getParameter('optionF');
    switch optionDvalueNumeric
        case num2cell([14 60 62:69])
            optionFparameter.TypeOptions = {'none'};
            optionFparameter.Enabled = 'off';
        case num2cell(37:44)
            optionFparameter.Enabled = 'on';
            options = num2cell(1:21);
            options = cellfun(@(x) num2str(x), options, 'UniformOutput', false);
            optionFparameter.TypeOptions = options;
        case num2cell([1:13 15:36 45:59 61 70:77])
            optionFparameter.Enabled = 'on';
            options = num2cell(1:31);
            options = cellfun(@(x) num2str(x), options, 'UniformOutput', false);
            optionFparameter.TypeOptions = options;
        otherwise
            optionEparameter.TypeOptions = {'none'};
            error('Unable to configure Option G. This is not normal. There is probably a bug. Did you add a new option?');
    end
catch exception
    betterSimulinkExceptions(exception)
end

end

