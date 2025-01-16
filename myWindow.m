clear
% input signal
[sn,Fs] = audioread('sine_A4.wav');
sn = makeMono(sn);
sn = sn(1:10*Fs);

% window length based on ms
WL = round(1024);

% maximum amount of windows that can fit into input signal
numWin = floor(length(sn)/WL);

% define window
ham = hamming(WL);

% create vector for window signal
winVect = zeros(length(sn),1);

% fill the vector with hamming windows
for i = 0:numWin-1
    winSindex = (i+1)*WL-WL+1;
    winEIndex = (i+1)*WL;
    
    winVect(winSindex:winEIndex) = ham;

end

% replace the end of the winVect with the remaining segment of the window
winMod = mod(length(sn),WL);
winRem = ham(1:end-(WL-winMod));
remIndexStart = length(winVect)-winMod+1;
winVect(remIndexStart:length(winVect)) = winRem;


% windowed signal - no overlap
an = sn.*winVect;

% overlap
olap = 0.5;

% hop size
hop = floor(WL*(1-olap));

% take no olap signal and place into buffers
rn = buffer(an,WL);

% overlap-add segments based on hopsize
for i=1:numWin

    in1 = hop;
    in2 = 2*hop-1;
    
    c1 = rn(in1:in2,i);
    c2 = rn(1:in1,i+1);
    c3 = c1+c2;
    qn(:,i) = c3;

end

% put back together into a single vector
qn = qn(:);

% % accomodate for the remaining samples
% zn = zeros(length(qn)+length(winRem),1);
% zn(1:length(qn)) = qn;
% slipPoint = length(zn)-length(qn)+1;
% zn(length(qn)+1:end) = 0;
% zn(length(zn)-slipPoint+1:length(zn)) = rn(length(zn)-(length(zn)-slipPoint+1):1024,430);

% plot(qn)
% cla
% hold on
% plot(c1)
% plot(c2)
% plot(c3)
% hold off
% rn(in1+hop)










%