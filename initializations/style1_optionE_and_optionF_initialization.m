% Configure what data to load
style1_optionE_only_initialization % call other script for code reuse

load('Style1_OptionF_Data');

%% work around to fix dependency analysis
% TODO remove this once Mathworks fixes the Depdency Analysis.
optionE = eval('optionE');
optionF = eval('optionF');