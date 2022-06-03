X = [1.8^3 1.8^2 1.8; 5.7^3 5.7^2 5.7; 0 1 0];
M = [1.4 ; 3.5 ; 0];

abc = (X\M);


Iq = linspace(0, 5.7, 2048)';

kT = torqueconstant(Iq, abc);

figure 
plot(Iq, kT)
grid on


function [kT] = torqueconstant(Iq, abc)
    kT = [];
    a = abc(1);
    b = abc(2);
    c = abc(3);
    
    for i = 1:length(Iq) 
        kT = [kT; a * Iq(i)^2 + b * Iq(i) + c];
    end
end

