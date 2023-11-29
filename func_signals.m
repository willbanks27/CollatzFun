%%% Will Banks, ECE Undergraduate @UKY, 2023

% unction that takes an input array and converts it into a 
% single column matrix to create a signal

function [sigData] = func_signals(numRow, col, mInput)

    sigData = zeros(numRow,1);
    
    for i=1:numRow
        
        % as of right now idk how to deal with the infinities 
        % and nonexisting values so I just set them to zero

            TF_inf = isinf(mInput(i,col));
            TF_NaN = isnan(mInput(i,col));

            if TF_inf==1 || TF_NaN
                sigData(i,1) = 0;
            else
                sigData(i,1) = mInput(i,col);
            end

    end



end

