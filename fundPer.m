function FP = fundPer(s,fs,w,olap)

winSpec = hamming(round(.05*fs));

if size(s,2)>1
    s = (s(:,1)+s(:,2))/2;
end

hr = harmonicRatio(...
    s,Window=winSpec,SampleRate=fs,Overlap=olap,...
    SpectralDescriptorInput="melSpectrum");

maxI = 0;
for i=0:length(hr)-1
    if hr(i+1)==max(hr)
        maxI = i;
    end
end

FP = maxI/fs;


end