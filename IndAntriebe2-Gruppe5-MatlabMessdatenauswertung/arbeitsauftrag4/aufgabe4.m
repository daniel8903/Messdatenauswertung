A_ = [1.8^3 1.8^2 1.8; 5.7^3 5.7^2 5.7; 0 1 0];
b_ = [1.4 ; 3.5 ; 0];

abc = (A_\b_);


Iq = linspace(0, 5.7, 2048)';

kT = torqueconstant(Iq, abc);

figure
hold on
grid on
plot(Iq, kT)
plot(1.8, 0.77780,'x')
plot(5.7, 0.6140,'x')
xlabel('Iq in A') 
ylabel('kT')

hold off


function [kT] = torqueconstant(Iq, abc)
    kT = zeros(size(Iq));
    a = abc(1);
    b = abc(2);
    c = abc(3);
    
    for i = 1:length(Iq) 
        kT(i) = a * Iq(i)^2 + b * Iq(i) + c;
    end
end

