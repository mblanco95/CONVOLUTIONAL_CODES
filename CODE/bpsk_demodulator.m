%% BPSK DEMODULATOR.
%%
function [demodulated_frame_rx] = bpsk_demodulator(encoded_frame_rx)

demodulated_frame_rx = (encoded_frame_rx - 1)/2;

end

