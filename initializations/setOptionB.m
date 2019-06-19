function setOptionB(thisBlockPath, optionB)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here


% set the active variant in option B
optionBblockPath = [thisBlockPath '/' 'Option B'];
optionBlabel = sprintf('Option_%s', optionB);
set_param(optionBblockPath, 'LabelModeActiveChoice', optionBlabel);
end

