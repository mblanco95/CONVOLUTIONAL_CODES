% ASSUMING ES 1 FOR BSPK; SYMBOL ENERGY NORMALIZED TO 1.
function [noise_variance] = ebno_to_noise_variance(ebno_db, rm, rc)
    rbno_nu = 10.^(ebno_db*0.1);
    noise_variance = (2*rm*rc*rbno_nu).^-1;
end

