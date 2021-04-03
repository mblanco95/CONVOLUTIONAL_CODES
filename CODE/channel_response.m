%% CHANNEL RESPONSE.
%%
function [modulated_frame_rx] = channel_response(modulated_frame_tx)
    
    frame_length = length(modulated_frame_tx);
    noise = sqrt(noise_variance)*randn(frame_length, 1);
    
    
    modulated_frame_rx = modulated_frame_tx + noise;
end

