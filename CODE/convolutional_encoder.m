function [encoded_frame] = convolutional_encoder(uncoded_frame)
    N = 2;
    state = 0;
    
    frame_length = length(uncoded_frame);
    encoded_frame = zeros(frame_length*N,1);

    for bit_index = 1 : frame_length
        switch state
        case 0 %'00' 
            %1/11
            if uncoded_frame(bit_index)
                encoded_frame(N*bit_index - 1) = 1; 
                encoded_frame(N*bit_index) = 1;
                state = 2; %'10';
            %0/00         
            else
                encoded_frame(N*bit_index - 1) = 0; 
                encoded_frame(N*bit_index) = 0;
                state = 0; %'00';
            end
        case 1 %'01'
            %1/00
            if uncoded_frame(bit_index)
                encoded_frame(N*bit_index - 1) = 0; 
                encoded_frame(N*bit_index) = 0;
                state = 2; %'10';
            %0/11     
            else
                encoded_frame(N*bit_index - 1) = 1; 
                encoded_frame(N*bit_index) = 1;
                state = 0; %'00';
            end
        case 2 %'10'
            %1/01
            if uncoded_frame(bit_index)
                encoded_frame(N*bit_index - 1) = 0; 
                encoded_frame(N*bit_index) = 1;
                state = 1; %'10';  
            %0/10
            else
                encoded_frame(N*bit_index - 1) = 1; 
                encoded_frame(N*bit_index) = 0;
                state = 4; %'11';   
            end
        case 3 %'11'
            %1/10
            if uncoded_frame(bit_index)
                encoded_frame(N*bit_index - 1) = 1; 
                encoded_frame(N*bit_index) = 0;
                state = 1; %'01'; 
            %0/01
            else
                encoded_frame(N*bit_index - 1) = 0; 
                encoded_frame(N*bit_index) = 1;
                state = 4; %'11';   
            end
        otherwise
        end
    end
end 
