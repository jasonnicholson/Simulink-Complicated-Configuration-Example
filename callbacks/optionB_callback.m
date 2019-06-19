function optionB(thisBlock)
% Specific function to configure the mask based on option B
%
%   optionB(thisBlock)
%
%% Inputs
%    thisBlock - Handle of the block to configure

% Author(s): Jason Nicholson
% $Date: 2019/06/11 14:01:00 $

%% Configure Option D

try
    % get the current value of the optionA. Note this must be done with
    % get_param and not using thisMask because thisMask does not contain the
    % updated optionA value yet.
    optionAvalue = get_param(thisBlock,'optionA');
    optionBvalue = get_param(thisBlock,'optionB');
    
    % Get the current block and mask
    thisMask = Simulink.Mask.get(thisBlock);
    
    % Configure option D based on option A and B
    optionDparameter = thisMask.getParameter('optionD');
    switch optionAvalue
        case '1'
            switch optionBvalue
                case {'1','2'}
                    optionDparameter.TypeOptions = {'1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27','28','29','30','31','32','33','34','35','36','45','46','47','48','49','50','51','54','55','56','57','59','60','69','70','71','72','73','74','75','76'};
                case '3'
                    optionDparameter.TypeOptions = {'1','2','3','4','5','6','7','8','9','10','11','12','28','29','30','31','32','33','34','35','36','45','46','47','48','49','50','51','54','55','56','57','59','60','69','70','71','72','73','74','75','76'};
                otherwise
                    optionDunknown(optionDparameter);
            end
        case '2'
            switch optionBvalue
                case '1'
                    optionDparameter.TypeOptions = {'1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27','28','29','30','31','32','33','34','35','36','45','46','47','48','52','49','50','51','53','54','56','57','59','60','61','62','63','64','65','66','67','68','69','70','71','72','73','74','75','76'};
                case '2'
                    optionDparameter.TypeOptions = {'1','2','3','4','5','6','7','8','9','10','11','12','28','29','30','31','32','33','34','35','36','45','46','47','48','52','49','50','51','53','54','56','57','59','60','61','62','63','64','65','66','67','68','69','70','71','72','73','74','75','76'};
                otherwise
                    optionDunknown(optionDparameter);
            end
        case '3'
            switch optionBvalue
                case {'1','2','4','5'}
                    optionDparameter.TypeOptions = {'1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27','28','29','30','31','32','33','34','35','36','45','46','47','48','52','49','50','51','54','56','57','58','59','60','61','62','63','64','65','66','67','68','69','70','71','72','73','74','75','76'};
                case '3'
                    optionDparameter.TypeOptions = {'1','2','3','4','5','6','7','8','9','10','11','12','28','29','30','31','32','33','34','35','36','45','46','47','48','52','49','50','51','54','56','57','58','59','60','61','62','63','64','65','66','67','68','69','70','71','72','73','74','75','76'};
                otherwise
                    optionDunknown(optionDparameter);
            end
        case '4'
            switch optionBvalue
                case {'1','2'}
                    optionDparameter.TypeOptions = {'37','38','39','40','41','42','43','44','56','57','59','60'};
                otherwise
                    optionDunknown(optionDparameter);
            end
        case '5'
            switch optionBvalue
                case {'1','2','3','4'}
                    optionDparameter.TypeOptions = {'3','5','6','7','11','29','30','31','46','56','57','59','60','61','62','63','64'};
                otherwise
                    optionDunknown(optionDparameter);
            end
        case '6'
            switch optionBvalue
                case {'1','2'}
                    optionDparameter.TypeOptions = {'37','38','39','40','41','42','43','44','56','57','59','60'};
                otherwise
                    optionDunknown(optionDparameter);
            end
        otherwise
            optionDparameter.TypeOptions = {'none'};
            error('option A set to unknown value. It is not possible to configure option D.');
    end % end switch
    
catch exception
    betterSimulinkExceptions(exception)
end
%% Call option D callback
optionD(thisBlock);

end

function optionDunknown(optionDparameter)
optionDparameter.TypeOptions = {'none'};
error('Option A and B combination unknown. Not possible to configure option D.');
end