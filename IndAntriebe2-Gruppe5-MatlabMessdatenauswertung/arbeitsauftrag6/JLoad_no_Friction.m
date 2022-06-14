[data,names]=load_traces('meas_data/JLoadWithoutFriction.trace');
w = data(:,3) / 57.295774896338;
I = data(:,4) / 1000;
t_ = data(:,1);

a = num_derivative(w, 0.001);
kT = torqueconstant(I);
M = kT .* I;

%%%%% Arbeitsauftrag 6 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a_abs = abs(a);
a_max = max(a_abs);
a_large_indices = find(a_abs >= 0.25*a_max);

M_large = zeros(size(a_large_indices));

for i = length(a_large_indices):-1:1
    M_large(i) = M(a_large_indices(i))/a(a_large_indices(i));
end
J = mean(M_large); % kgm^2

M_acceleration = J * a;

J_Motor = 0.205;
J_load = J*10000 - J_Motor; % 1.8684 in kgcm^2

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure 

subplot(3,1,1)
plot(t_, w, 'b');
xlabel('t in ms') 
ylabel('ω in rad/s')
grid on

subplot(3,1,2)
plot(t_, a);
xlabel('t in ms') 
ylabel('α in rad/s²')
grid on

subplot(3,1,3)
hold on
plot(t_, M_acceleration);
plot(t_, M, 'r');
xlabel('t in ms') 
ylabel('M in Nm')
grid on
hold off

clear i; 


