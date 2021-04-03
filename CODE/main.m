%%
% @file: main.m
% @author: BLANCO CAAMANO, MARTA.
%
% @about: LAB #2: CONVOLUTIONAL CODES.
%         ADVANCED TECHNIQUES IN SIGNAL PROCESSING AND COMMUNICATIONS.
%%
clearvars;

%% DEFINE PARAMATERS.
FRAME_LENGTH = 1024;
MC = 10000; % MONTECARLO.  
EBNO_DB = 0:0.1:1.8;  % ENERGY BIT/NOISE POWER SPECTRAL.
M_BPSK = 2;
RC = 1/2; % CODE RATE. 

rm = log2(M_BPSK); % MODULATION RATE. 
noise_variance = ebno_to_noise_variance(EBNO_DB, rm, RC);
                                            
% SIMULATION PARAMETERS.       
montecarlo = zeros(length(noise_variance), MC);
results = zeros(length(noise_variance));


%% BINARY FRAME.
uncoded_frame_tx = randi([0 1], FRAME_LENGTH, 1);

%% CONVOLUTIONAL ENCODER.
encoded_frame_tx = convolutional_encoder(uncoded_frame_tx);

%% MODULATOR
modulated_frame_tx = bpsk_modulator(encoded_frame_tx);

%% CHANNEL RESPONSE.
modulated_frame_rx = channel_response(modulated_frame_tx, noise_variance);

%% DEMODULATOR
demodulated_frame_rx = bpsk_modulator(modulated_frame_rx);

%% VITERBI DECODER.
uncoded_frame_rx = viterbi_decoder(demodulated_frame_rx);



