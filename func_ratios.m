%%% Will Banks, ECE Undergraduate @UKY, 2023

% function that computes various ratios of the step quantities 

function [inDivStep, eveDivOdd, oddDivEve] = func_ratios(input, stepAmt, eOut, oOut)
    
    % return various ratios
    inDivStep = input/stepAmt;
    eveDivOdd = eOut/oOut;
    oddDivEve = oOut/eOut;

end