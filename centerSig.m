% very unoptimized. can be fixed later. 
% this function takes two signals, figures out which one is longer, centers
% the signals, then truncates to create two new signals equal length

function [in1Final,in2Final] = centerSig(in1,in2)

    if length(in1)>length(in2)
        % take lengths of signals
        len1 = length(in1);
        len2 = length(in2);
        
        % calculate the difference of lengths and that length divided by two
        nlen = len1-len2;
        nnlen = round(nlen/2);
        
        % apply zero padding and shift to center
        in2pad = zeros(length(in1),1);
        in2pad(1:end-nlen) = in2(:,1);
        in2pad = circshift(in2pad,nnlen);
        
        % set zero threshold
        threshold = 1e-8;
        in2pad(in2pad < threshold) = 0;
        
        % find where the zeros start and finish
        in2pad_start = find(in2pad ~= 0, 1, 'first');
        in2pad_end = find(in2pad ~= 0, 1, 'last');
        
        % adjust the in1 to delete any values outside
        in1pad = in1;
        in1pad(1:in2pad_start) = 0;
        in1pad(in2pad_end:end) = 0;
        
        % lastly, remove zeros for accuracy, making a new signal with new length
        in1Final = in1pad(in2pad_start:in2pad_end);
        in2Final = in2pad(in2pad_start:in2pad_end);
    
    elseif length(in1)<length(in2)
    
        swap1 = in1;
        swap2 = in2;
        % in1 = 0;
        % in2 = 0;
    
        in1 = swap2;
        in2 = swap1;
    
        % take lengths of signals
        len1 = length(in1);
        len2 = length(in2);
        
        % calculate the difference of lengths and that length divided by two
        nlen = len1-len2;
        nnlen = round(nlen/2);
        
        % apply zero padding and shift to center
        in2pad = zeros(length(in1),1);
        in2pad(1:end-nlen) = in2(:,1);
        in2pad = circshift(in2pad,nnlen);
        
        % set zero threshold
        threshold = 1e-8;
        in2pad(in2pad < threshold) = 0;
        
        % find where the zeros start and finish
        in2pad_start = find(in2pad ~= 0, 1, 'first');
        in2pad_end = find(in2pad ~= 0, 1, 'last');
        
        % adjust the in1 to delete any values outside
        in1pad = in1;
        in1pad(1:in2pad_start) = 0;
        in1pad(in2pad_end:end) = 0;
        
        % lastly, remove zeros for accuracy, making a new signal with new length
        in1Final = in1pad(in2pad_start:in2pad_end);
        in2Final = in2pad(in2pad_start:in2pad_end);

    elseif length(in1)==length(in2)
        in1Final = in1;
        in2Final = in2;

    end

end