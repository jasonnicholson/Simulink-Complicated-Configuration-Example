function generateData

getname = @(x) inputname(1);

for i=1:6
    optionA = sprintf("optionA%d",i);
    fileA = sprintf("%s_data",optionA);
    A = sprintf("%s loaded", fileA);
    save(fileA,getname(A));
    
    switch i
        case 1
            optionBgenerate(3)
        case 2
            optionBgenerate(2)
        case 3
            optionBgenerate(5)
        case 4
            optionBgenerate(2)
        case 5
            optionBgenerate(4)
        case 6
            optionBgenerate(2)
    end % end switch
end

%% Nested function
    function optionBgenerate(n)
        for j = 1:n
            optionB =  sprintf("optionB%d",j);
            fileB = sprintf("%s_%s", optionA, optionB);
            B = sprintf("%s loaded", fileB);
            save(fileB, getname(B));
        end % end for
    end % end nested function

end % end generateData