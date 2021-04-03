%% BPSK MODULATOR.
%%
function [modulated_frame_tx] = bpsk_modulator(encoded_frame_tx)

modulated_frame_tx = 2*encoded_frame_tx - 1;

end

