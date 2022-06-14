%%%%%  Arbeitsauftrag 7  %%%%%%%%%%%%%%%%%%%%%%%%%
[data,names]=load_traces('meas_data/JLoadWithFriction.trace');
w = data(:,3) / 57.295774896338;
I = data(:,4) / 1000;
t_ = data(:,1);

a = num_derivative(w, 0.001);

kT = torqueconstant(I);

M = kT .* I;

figure

subplot(3,1,1)
hold on
plot(t_, w, 'b');
xlabel('t in ms') 
ylabel('ω in rad/s')
grid on
hold off

subplot(3,1,2)
hold on
plot(t_, a, 'b');
xlabel('t in ms') 
ylabel('α in rad/s²')
grid on
hold off

subplot(3,1,3)
hold on
plot(t_, M, 'r');
xlabel('t in ms') 
ylabel('M in Nm')
grid on
hold off

