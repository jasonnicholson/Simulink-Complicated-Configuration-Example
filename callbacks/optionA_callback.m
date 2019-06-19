function optionA_callback(thisBlock)
% Specific function to configure the mask based on option A
%
%   optionA(thisBlock)
%
%% Inputs
%    thisBlock - Handle of the block to configure

% Author(s): Jason Nicholson
% $Date: 2019/06/11 13:47:00 $

%% Configure Option B
try
    % get the current value of the optionA. Note this must be done with
    % get_param and not using thisMask because thisMask does not contain the
    % updated optionA value yet.
    optionAvalue = get_param(thisBlock,'optionA');
    
    % Get the current block and mask
    thisMask = Simulink.Mask.get(thisBlock);
    
    % Configure option B based on option A
    optionBparameter = thisMask.getParameter('optionB');
    switch optionAvalue
        case '1'
            optionBparameter.TypeOptions = {'1','2','3'};
        case '2'
            optionBparameter.TypeOptions = {'1','2'};
        case '3'
            optionBparameter.TypeOptions = {'1','2','3','4','5'};
        case '4'
            optionBparameter.TypeOptions = {'1','2'};
        case '5'
            optionBparameter.TypeOptions = {'1','2','3','4'};
        case '6'
            optionBparameter.TypeOptions = {'1','2'};
        otherwise
            optionBparameter.TypeOptions = {'none'};
            error('option A set to unknown value. It is not possible to configure option B.');
    end % end switch
catch exception
    betterSimulinkExceptions(exception)
end

%% call option B callback
optionB_callback(thisBlock);


end % end function