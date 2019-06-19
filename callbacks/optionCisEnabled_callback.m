function optionCisEnabled_callback(thisBlock)
% Specific function to activate option C
%
%   optionA(thisBlock)
%
%% Inputs
%    thisBlock - Handle of the block to configure

% Author(s): Jason Nicholson
% $Date: 2019/06/11 13:47:00 $

%% Configure Option C
try
    % get the current value of isOptionCenabled. Note this must be done with
    % get_param and not using thisMask because thisMask does not contain the
    % updated isOptionCenabled value yet.
    isEnabled = strcmpi(get_param(thisBlock, 'isOptionCenabled'), 'on');
    
    
    % Get the current block and mask
    thisMask = Simulink.Mask.get(thisBlock);
    
    % Setup option C
    optionCparameter = thisMask.getParameter('optionC');
    if isEnabled
        optionCparameter.Enabled = 'on';
    else
        optionCparameter.Enabled = 'off';
        optionCparameter.Value = '0';
    end
    
catch exception
    betterSimulinkExceptions(exception);
end % end try catch

end % end function

