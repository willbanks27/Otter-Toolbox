% Will Banks
% sometimes signals have weird spikes at the start and end of a signal. 
% to deal with this, a short fade in/out is applied to the start and end 
% of an input signal.

function [out, ramp] = fade(sn,fadeLen)

    % take the length of the input features
    % snLen = length(sn);
    
    % create a a positive and negative ramp function based on the 
    % desired fade length
    
    % ramp axis
    tr = 1:fadeLen;
    % positive ramp
    xtp = (1/length(tr)).*tr;
    % negative ramp
    xtn = -(1/length(tr)).*tr + 1;
    
    % create ones vector the size of the spectral input for matrix
    % multiplication later
    ramp = ones(length(sn),1);
    
    % replace the first values with the positive ramp and 
    % the last values with the negative ramp
    ramp(1:length(tr)) = xtp;
    ramp(length(ramp)-length(tr)+1:end) = xtn;
    
    % finally, matrix multiple the spectral feature and fade vector 
    % to apply a fade in/out
    out = ramp.*sn;

end