%%% Will Banks, ECE Undergraduate @UKY, 2023

function mDiff = func_diff(numRows, mOdd, mEve)

mDiff = zeros(numRows, 1);

for i=1:numRows

    mDiff(i,1)=mEve(i,1)-mOdd(i,1);
    
end
