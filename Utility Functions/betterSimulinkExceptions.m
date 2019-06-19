function betterSimulinkExceptions(exception)
% Display the extended exception report to the MATLAB command line
%
%% Input Arguments
% exception - Type MSLException generated by Simulink.
% 
%% Description
% The ability to troubleshoot initializations and callbacks in Simulink
% needs improvement. This function allows for better tracking of where the
% error comes from. The getReport method (part of the MException class
% which is a superclass of MSLException) has the information of where
% exactly the error occurred. betterSimulinkExceptions uses the
% getReport('extended') method to display a better message of the error
% occured at the MATLAB command line. Then, the error is rethrown.
%

% Author(s): Jason Nicholson
% $Date: 2019/06/11 14:51:00 $

fprintf('\n\n');
display(exception.getReport('extended'));
communicatingException = MException('InitializationOrCallback:Error', 'Check the MATLAB command window for the detailed error report.');
throw(communicatingException);
end

