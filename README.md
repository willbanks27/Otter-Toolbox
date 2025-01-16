1. fade

Description:
Applies a fade-in at the beginning and a fade-out at the end of an input signal to smooth out abrupt spikes that can occur at the signal boundaries.

Inputs:

    sn: The input signal (vector).
    fadeLen: The length of the fade (number of samples).

Outputs:

    out: The signal with the fade-in and fade-out applied.
    ramp: The ramp function used to apply the fade.

Usage:

[out, ramp] = fade(sn, fadeLen);

2. loadCells

Description:
Loads a .mat file containing a structure and extracts the first cell array within that structure. This is particularly useful when dealing with MATLAB .mat files that store multiple variables, and you need to extract specific data.

Inputs:

    fileName: The name of the file to load (e.g., 'data.mat').

Outputs:

    cells: The cell array extracted from the first field in the loaded structure.

Usage:

cells = loadCells('data.mat');

3. makeMono

Description:
Converts a stereo audio signal into a mono signal by averaging the left and right channels. It also returns the left and right channels separately if desired.

Inputs:

    stereoSig: A 2-column matrix, where the first column is the left channel and the second column is the right channel.

Outputs:

    monoOut: The mono version of the input signal.
    Lout: The left channel of the input signal.
    Rout: The right channel of the input signal.

Usage:

[monoOut, Lout, Rout] = makeMono(stereoSig);

4. sigProc

Description:
Removes the DC component from an input signal and scales its values so that the maximum value of the signal is 1. This is useful for preprocessing signals before further analysis or processing.

Inputs:

    in: The input signal (vector).

Outputs:

    processedSignal: The processed signal with no DC component and a maximum value of 1.

Usage:

processedSignal = sigProc(in);

5. centerSig

Description:
Centers two signals of different lengths and truncates them to create two new signals of equal length. The function adjusts the longer signal by zero-padding, shifting it, and removing the DC component, ensuring that both signals are aligned and of the same length.

Inputs:

    in1: The first input signal (vector).
    in2: The second input signal (vector).

Outputs:

    in1Final: The first centered and truncated signal.
    in2Final: The second centered and truncated signal.

Usage:

[in1Final, in2Final] = centerSig(in1, in2);
