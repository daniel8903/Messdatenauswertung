function [kT] = torqueconstant(Iq)
    kT = zeros(size(Iq));
    a = -0.005598040685760;
    b = -9.462179805505824e-17;
    c = 0.795915429599640;
    
    for i = 1:length(Iq) 
        kT(i) = a * Iq(i)^2 + b * Iq(i) + c;
    end
end
