%%% Will Banks, ECE Undergraduate @UKY, 2023

% function that counts the amount of total, even, and odd steps

function [allStep, evenStep, oddStep] = func_stepsAmt(x)

    % initialize counters
    allStep = 0;
    evenStep = 0;
    oddStep = 0;
    
    % "1" is a special case. it takes 1 step, but won't be compatible
    % with the following four loop.
    % this if/else statement takes care of this.
    if x==1
        oddStep=1;
        
    else

        % while the input is not equal to one, run through the loop
        while x~=1
    
            % if x is divisable by two, let x = x/2 
            % and add one more step to the evenStep counter
            if mod(x,2)==0
                x = x/2;
                evenStep = evenStep+1;
    
            % if x is not divisable by two, let x = 3x+1
            % and add one more step to the oddStep counter
    
            else
                
                x = 3*x+1;
                oddStep = oddStep+1;
    
            end
            
            % add one more step to the counter
            allStep = allStep+1;
        
        end

    end

end

