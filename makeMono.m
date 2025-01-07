% Will Banks 2025
% stupid simple function to make a stereo audio signal mono
% also returns the left and right channel, if desired

function [monoOut, Lout, Rout] = makeMono(stereoSig)

    monoOut = (stereoSig(:,1) + stereoSig(:,2)/2);

    Lout = stereoSig(:,1);
    Rout = stereoSig(:,2);

end
