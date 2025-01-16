% simple function to remove DC component and scale the values of 
% a signal to 1

function processedSignal = sigProc(in)

    in = (1/max(in)).*in;
    
    processedSignal = in-mean(in);


end