clear;
%%% Will Banks, ECE Undergraduate @UKY, 2023
%%% input whole number greater than 0

    input = 10e4;
    row = input;
    col = 7;
    mData = zeros(row,col);
    fs = 44.1e3;

for i=1:input
    
    % run the input thru the function definitions 
    
        % stepAmt -> amount of "steps" it takes for the 
        %            sequence to reach 1.
        % eOut -> amount of times the internal "even" function
        %         is ran via the if/else statement
        % oOut -> amount of times the internal "odd" function
        %         is ran via the if/else statement
            [stepAmt, eOut, oOut] = func_stepsAmt(i);
    
        % inDivStep -> input/stepAmt
        % eveDivOdd -> eOut/oOut
        % oddDivEve ->oOut/eOut
            [inDivStep, eveDivOdd, oddDivEve] = func_ratios(i, stepAmt, eOut, oOut);

    % store recorded data in the mData matrix
    % input | steps | #even | #odd | input/step | even/odd |  odd/even
        mData(i, 1) = i;
        mData(i, 2) = stepAmt;
        mData(i, 3) = eOut;
        mData(i,4) = oOut;
        mData(i,5) = inDivStep;
        mData(i,6) = eveDivOdd;
        mData(i,7) = oddDivEve;

end

% convert the various data from mData into separate signals
    sig_in = func_signals(input,1,mData);
    sig_steps = func_signals(input,2,mData);
    sig_eve = func_signals(input,3,mData);
    sig_odd = func_signals(input,4,mData);
    sig_inDivStep = func_signals(input,5,mData);
    sig_eveDivOdd = func_signals(input,6,mData);
    sig_oddDivEve = func_signals(input,7,mData);


sig_diffEO = func_diff(row, sig_odd, sig_eve);    
sig_diffOE = func_diff(row, sig_eve, sig_odd);

% plots

    time = (0:input-1)/fs; % time axis in seconds
    xAx = [0, (length(sig_steps))/fs]; % define variable x axis limits
    
    figure(1)
    tiledlayout(3,1)

        nexttile
        
            plot(time, sig_steps) % plot step sequence
            title('Signal Step Sequence')
            xlabel('Time (seconds)')
            ylabel('Amplitude')
            xlim(xAx)
    
        nexttile
            plot(time, sig_eve, 'green') % plot even step sequence signal
            title('# of Even Values in Step Sequence')
            xlabel('Time (seconds)')
            ylabel('Amplitude')
            xlim(xAx)
    
        nexttile
            plot(time, sig_eve, 'red') % plot odd step sequence signal
            title('# of Odd Values in Step Sequence')
            xlabel('Time (seconds)')
            ylabel('Amplitude')
            xlim(xAx)

% prepare the signal for audio export:
% do a rough ac-couple operation by cancelling out the DC component
% multiply the signal by a small constant to reduce amplitude and 
% prevent major distortion
    collatzOut = (1/40)*(sig_eve - 40);

% write to .wav file
    audiowrite('collatz.wav', collatzOut,fs)
















%

